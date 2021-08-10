import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:meta/meta.dart';
import 'package:ecommerce_admin_tut/src/models/customer_analytics_item.dart';
import 'customer_analytics_state.dart';

class CustomerAnalyticsCubit extends Cubit<CustomerAnalyticsState> {
  CustomerAnalyticsCubit() : super(CustomerAnalyticsState.idle());
  final _firestore = getItInstance<FirestoreRepository>();

  void getCustomerAnalytics(String customerId) async {
    List<CustomerAnalyticsModel> analyticsList = [];

    emit(CustomerAnalyticsState.loading());
    try {
      final documents = await _firestore.getCustomerAnalytics(customerId);
      CustomerAnalyticsModel.fromJson(documents[0].data());
      // print();
      // analyticsList = List<CustomerAnalyticsModel>.generate(documents.length,
      //     (index) => CustomerAnalyticsModel.fromJson(documents[index].data()));
      emit(CustomerAnalyticsState.loaded(analyticsList));
    } catch (e) {
      print(e);
    }
  }
}
