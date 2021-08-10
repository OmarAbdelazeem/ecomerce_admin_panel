import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/banner_item/banner_item_state.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/crop_image.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/banner_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/banners_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/firebase_storage_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class BannerItemCubit extends Cubit<BannerItemState> {
  BannerItemCubit() : super(BannerItemState.idle());
  final _fireStoreRepo = getItInstance<FirestoreRepository>();
  final _firebaseStorageRepo = getItInstance<FirebaseStorageRepository>();
  final _bannersNotifier = getItInstance<BannersNotifier>();

  Future _uploadAndUpdateImage(String id, File image) async {
    try {
       String imageName = basename(image.path);
      final imageUrl = await _firebaseStorageRepo.uploadImageToFirebase(imageName,image,'banners');
      await _fireStoreRepo.updateBannerImage(id, imageUrl);
      return imageUrl;
    } catch (e) {
      print(e);
    }
  }

  Future uploadBanner(BannerModel banner, File image) async {
    emit(BannerItemState.loading());
    try {
      banner.imageId = basename(image.path);
      banner.name.english = TrimName.trimName(banner.name.english);
      banner.name.arabic = TrimName.trimName(banner.name.arabic);
      String imageUrl =
      await _firebaseStorageRepo.uploadImageToFirebase(banner.imageId!,image, 'banners');
      banner.image = imageUrl;
      await _fireStoreRepo.addBanner(banner);
      emit(BannerItemState.bannerUploaded(banner));
      _bannersNotifier.addBanner(banner);
    } catch (e) {
      print(e);
    }
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      emit(BannerItemState.imagePicked(File(pickedFile.path)));
  }

  Future<Null> pickAndUpdateImage(String bannerId) async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    var imageFile = pickedImage != null ? File(pickedImage.path) : null;

    if (imageFile != null) {
      File? croppedImage = await CropImage.cropImage(File(pickedImage!.path));
      if (croppedImage != null) {
        try {
          final imageUrl = await _uploadAndUpdateImage(bannerId, croppedImage);
          emit(BannerItemState.imageUpdated(imageUrl));
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void updateBannerName(
      {required String name,
        required String id,
        required bool isEnglishName}) async {
    emit(BannerItemState.loading());
    try {
      Map<String ,dynamic> field = isEnglishName ? {'name.en':name} : {'name.ar':name};
      await _fireStoreRepo.updateBanner(id: id, field: field);
      isEnglishName ? emit(BannerItemState.enNameEdited(name)): emit(BannerItemState.arNameEdited(name));
    } catch (e) {
      print(e);
      emit(BannerItemState.error(e.toString()));
    }
  }

  Future deleteBanner(String id) async {
    emit(BannerItemState.deleting());
    try {
      await _fireStoreRepo.deleteBanner(id);

      emit(BannerItemState.deleted());
      _bannersNotifier.removeBanner();
    } catch (e) {
      emit(BannerItemState.error(e.toString()));
      print(e);
    }
  }

  void updateBannerSwitchValue(String bannerId , bool value)async{
    try {
      await _fireStoreRepo.updateBannerSwitchValue(bannerId , value);
    } catch (e) {
      emit(BannerItemState.error(e.toString()));
      print(e);
    }
  }


  void closeImage() {
    emit(BannerItemState.imageClosed());
  }


}
