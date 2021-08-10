import 'dart:io';

import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_state.freezed.dart';

@freezed
abstract class ProductItemState with _$ProductItemState {
  const factory ProductItemState.idle() = Idle;

  const factory ProductItemState.productDeleted() = ProductDeleted;

  const factory ProductItemState.categoryDeleted() = CategoryDeleted;

  const factory ProductItemState.fieldUpdated(dynamic value) = FieldUpdated;

  const factory ProductItemState.categoryUpdated(
      {required NameField mainCategory,
      required NameField subCategory}) = CategoryUpdated;

  const factory ProductItemState.imageUpdated(String image) = ImageUpdated;

  const factory ProductItemState.fieldError(String error) = FieldError;

  const factory ProductItemState.submitted(ProductModel product) = Submitted;

  const factory ProductItemState.imagePicked(File imageFile) = ImagePicked;

  const factory ProductItemState.imageClosed() = ImageClosed;

  const factory ProductItemState.loading() = Loading;

  const factory ProductItemState.deleting() = Deleting;

  const factory ProductItemState.error(String error) = Error;
}
