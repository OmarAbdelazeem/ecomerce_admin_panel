import 'dart:io';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_item_state.freezed.dart';

@freezed
abstract class BannerItemState with _$BannerItemState {
  const factory BannerItemState.idle() = Idle;

  const factory BannerItemState.imagePicked(File pickedImage) = ImagePicked;

  const factory BannerItemState.imageClosed() = ImageClosed;

  const factory BannerItemState.imageUpdated(String image) = ImageUpdated;

  const factory BannerItemState.loading() = Loading;

  const factory BannerItemState.deleting() = Deleting;

  const factory BannerItemState.bannerUploaded(BannerModel bannerModel) =
      BannerUploaded;

  const factory BannerItemState.enNameEdited(String enName) = EnNameEdited;

  const factory BannerItemState.arNameEdited(String arName) = ArNameEdited;

  const factory BannerItemState.deleted() = Deleted;

  const factory BannerItemState.error(String error) = Error;
}
