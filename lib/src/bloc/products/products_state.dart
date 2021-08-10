import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_admin_tut/src/models/notification_model.dart';
part 'products_state.freezed.dart';

@freezed

abstract class ProductsState with _$ProductsState {
  const factory ProductsState.idle() = Idle;

  const factory ProductsState.loading() = Loading;

  const factory ProductsState.loaded(
      List<dynamic> products) = Loaded;

  const factory ProductsState.filter() = Filter;

  const factory ProductsState.sort() = Sort;

  const factory ProductsState.finished() = Finished;


  const factory ProductsState.error(String error) = Error;
}