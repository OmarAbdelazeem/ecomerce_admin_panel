import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/bloc/orders/orders_state.dart';
import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/orders_sort_options.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/basic_order_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  var _firestoreRepo = getItInstance<FirestoreRepository>();

  OrdersCubit() : super(OrdersState.idle());
  late Stream<dynamic> ordersQuerySnapshot;

  fetchOrders(
      {OrdersSortOptions ordersSortingOptions = OrdersSortOptions.date,
      OrdersFilterOptions? orderStatusOption,
      OrderByOption orderOption = OrderByOption.Descending,
      DateTime? date}) {
    String? statusCondition;
    String sortCondition;
    bool descending = orderOption == OrderByOption.Descending ? true : false;

    emit(OrdersState.loading());

    switch (ordersSortingOptions) {
      case OrdersSortOptions.total:
        sortCondition = 'total';
        break;
      case OrdersSortOptions.date:
        sortCondition = 'ordered_at';
        break;
    }

    switch (orderStatusOption) {
      case OrdersFilterOptions.canceled:
        statusCondition = StringsConstants.cancelled;
        break;
      case OrdersFilterOptions.delivered:
        statusCondition = StringsConstants.delivered;
        break;
      case OrdersFilterOptions.processing:
        statusCondition = StringsConstants.processing;
        break;
      case OrdersFilterOptions.delivering:
        statusCondition = StringsConstants.delivering;
        break;
      case OrdersFilterOptions.all:
        // filterCondition = null;
        break;
    }

    try {
      print(
          'statusCondition is $statusCondition and sort condition is $sortCondition');
      ordersQuerySnapshot = _firestoreRepo.getAllOrders(
          statusCondition: statusCondition,
          sortingCondition: sortCondition,
          date: date != null
              ? DateTime.utc(date.year, date.month, date.day)
              : null,
          descending: descending);

      if (ordersQuerySnapshot
          is Stream<Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>) {
        ordersQuerySnapshot.listen((event) {
          List<BasicOrderModel> orders = [];
          List data = event.toList();
          orders = List<BasicOrderModel>.generate(data.length, (index) {
            print(data[index]);
            return BasicOrderModel.fromJson(data[index].data());
          });
          emit(OrdersState.loaded(orders));
        });
      } else {
        ordersQuerySnapshot.listen((event) {
          List<BasicOrderModel> list = [];

          list = List<BasicOrderModel>.generate(event.docs.length, (index) {
            print(event.docs[index]);
            return BasicOrderModel.fromJson(event.docs[index].data());
          });
          emit(OrdersState.loaded(list));
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchCustomerOrders(String customerId) async {
    emit(OrdersState.loading());
    try {
      final ordersDocs = await _firestoreRepo.getCustomerOrders(customerId);
      List<BasicOrderModel> ordersList = List<BasicOrderModel>.generate(
          ordersDocs.length,
          (index) => BasicOrderModel.fromJson(ordersDocs[index]));

      emit(OrdersState.loaded(ordersList));
    } catch (e) {
      print(e);
    }
  }

  void searchForOrder(String orderNumber) async {
    emit(OrdersState.loading());
    try {
      _firestoreRepo.searchForOrder(int.parse(orderNumber)).listen((order) {
        List<BasicOrderModel> orders = List<BasicOrderModel>.generate(order.docs.length,
                (index) => BasicOrderModel.fromJson(order.docs[index].data()));
        emit(OrdersState.loaded(orders));
      });
    } catch (e) {
      print(e);
      emit(OrdersState.error(e.toString()));
    }
  }

// fetchNextList() async {
//   try {
//     List<DocumentSnapshot> docs =
//         await firebaseRepo.getAllOrders(_documents[_documents.length - 1]);
//     _documents.addAll(docs);
//     _orderList = List<OrderModel>.generate(
//         _documents.length, (index) => OrderModel.fromJson(_documents[index]));
//     emit(ResultState.data(data: _orderList.toSet().toList()));
//   } catch (e) {
//     print(e);
//     emit(ResultState.unNotifiedError(error: e.toString(), data: _orderList));
//   }
// }
}
