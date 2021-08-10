import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/models/basic_order_model.dart';
import 'package:ecommerce_admin_tut/src/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState{
  const factory OrdersState.idle() = Idle;
  const factory OrdersState.loading() = Loading;
  const factory OrdersState.loaded(List<BasicOrderModel> orders) = Loaded;
  const factory OrdersState.filter() = Filter;
  const factory OrdersState.sort() = Sort;
  const factory OrdersState.error(String error) = Error;

}