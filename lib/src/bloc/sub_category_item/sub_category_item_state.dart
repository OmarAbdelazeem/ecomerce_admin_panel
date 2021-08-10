import 'dart:io';

import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category_item_state.freezed.dart';

@freezed
abstract class SubCategoryItemState with _$SubCategoryItemState {
  const factory SubCategoryItemState.idle() = Idle;

  const factory SubCategoryItemState.loading() = Loading;

  const factory SubCategoryItemState.enNameEdited(String enName) = EnNameEdited;

  const factory SubCategoryItemState.arNameEdited(String arName) = ArNameEdited;

  const factory SubCategoryItemState.deleted() = Deleted;


  const factory SubCategoryItemState.imageUpdated(String image) = ImageUpdated;

  const factory SubCategoryItemState.error(String error) = Error;

  const factory SubCategoryItemState.imagePicked(File image) = ImagePicked;
  const factory SubCategoryItemState.imageClosed() = ImageClosed;

  const factory SubCategoryItemState.subCategoryUploaded(SubCategoryModel subCategory) =
  SubCategoryUploaded;
}
