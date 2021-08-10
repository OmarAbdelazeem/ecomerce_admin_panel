import 'package:ecommerce_admin_tut/src/models/customer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customers_state.freezed.dart';

@freezed
abstract class CustomersState with _$CustomersState {
  const factory CustomersState.idle() = Idle;
  //
  const factory CustomersState.loading() = Loading;

  const factory CustomersState.customerLoaded(CustomerModel customer) = CustomerLoaded;
  const factory CustomersState.customersLoaded(List<CustomerModel> customers) = CustomersLoaded;

  const factory CustomersState.error(String error) = Error;
}
