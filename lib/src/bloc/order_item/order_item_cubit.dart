import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/order_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'order_item_state.dart';

class OrderCubit extends Cubit<OrderItemState> {
  OrderCubit() : super(OrderItemState.idle());
  var _firestoreRepo = getItInstance<FirestoreRepository>();
 late Stream<DocumentSnapshot> orderQuerySnapshot;

  fetchOrderDetails(String id) {
    emit(OrderItemState.loading());
    try {
      orderQuerySnapshot = _firestoreRepo.fetchOrderDetails(id);
      orderQuerySnapshot.listen((event) {
        OrderModel order = OrderModel.fromJson(event.data());
        emit(OrderItemState.loaded(order));
      });
    } catch (e) {
      print(e);
      emit(OrderItemState.error(e.toString()));
    }
  }

  // void updateOrderStatus(
  //     {@required String status, @required String orderId}) async {
  //   if (status == 'Delivered' ||
  //       status == 'Cancelled' ||
  //       status == 'Delivering') {
  //     String newOrderStatus;
  //       emit(OrderState.statusLoading());
  //    try{
  //
  //    }catch(e){
  //      // add order number
  //      if (status == 'Delivering') {
  //        int orderNumber = await _firebaseRepo.getOrderNumber(orderId);
  //
  //        await _firebaseRepo.updateOrderStatus(status, orderId, orderNumber);
  //      } else {
  //        await _firebaseRepo.updateOrderStatus(status, orderId);
  //      }
  //    }
  //   }
  // }

  void updateOrderStatus(
      {@required String? status, @required String? orderId}) async {
    emit(OrderItemState.statusLoading());
    try {
      // add order number
      if (status == StringsConstants.delivering) {
        int orderNumber = await _firestoreRepo.getOrderNumber(orderId!);

        await _firestoreRepo.updateOrderStatus(status!, orderId, orderNumber);
      } else if (status == StringsConstants.delivering ||
          status == StringsConstants.cancelled) {
        await _firestoreRepo.updateOrderStatus(status!, orderId!);
      }

      emit(OrderItemState.statusLoaded(status!));
    } catch (e) {
      print(e);
      emit(OrderItemState.error(e.toString()));
    }
  }

  // Widget actionButton(String status) {
  //   if (status == 'Processing') {
  //     return TextButton(
  //       child: Text(
  //         'Prepare Order',
  //         style: TextStyle(color: Colors.green.shade600, fontSize: 17),
  //       ),
  //       onPressed: () {
  //         placeOrderCubit.updateOrderStatus(
  //             orderId: widget.orderId, status: 'Delivering');
  //         ordersProvider.reloadOrders();
  //       },
  //     );
  //   } else if (status == 'Delivering') {
  //     return Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         TextButton(
  //           child: Text('Delivered',
  //               style: TextStyle(color: Colors.green.shade600, fontSize: 17)),
  //           onPressed: () {
  //             placeOrderCubit.updateOrderStatus(
  //                 orderId: widget.orderId, status: 'Delivered');
  //             ordersProvider.reloadOrders();
  //           },
  //         ),
  //         SizedBox(
  //           width: 15,
  //         ),
  //         TextButton(
  //           child: Text('Cancelled',
  //               style: TextStyle(color: Colors.red, fontSize: 17)),
  //           onPressed: () {
  //             placeOrderCubit.updateOrderStatus(
  //                 orderId: widget.orderId, status: 'Cancelled');
  //             ordersProvider.reloadOrders();
  //           },
  //         )
  //       ],
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // void testStatus(String currentStatus, String orderId) {
  //   if (currentStatus == 'Processing') {
  //     _firestoreRepo.updateOrderStatus('Delivering', orderId);
  //     // ordersProvider.reloadOrders();
  //   } else if (currentStatus == 'Delivering') {
  //     _firestoreRepo.updateOrderStatus('Delivering', orderId);
  //   }
  // }
}
