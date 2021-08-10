import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/crop_image.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/sub_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/firebase_storage_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'sub_category_item_state.dart';
import 'package:path/path.dart';

class SubCategoryItemCubit extends Cubit<SubCategoryItemState> {
  SubCategoryItemCubit() : super(SubCategoryItemState.idle());

  final FirebaseStorageRepository? _firebaseStorageRepo =
      getItInstance<FirebaseStorageRepository>();

  final FirestoreRepository? _firestoreRepo =
      getItInstance<FirestoreRepository>();

  final _subCategoriesNotifier = getItInstance<SubCategoriesNotifier>();


  void updateSubCategoryName(
      {required String name,
      required String id,
      required bool isEnglishName}) async {
    emit(SubCategoryItemState.loading());
    try {
      Map<String ,dynamic> field = isEnglishName ? {'name.en':name} : {'name.ar':name};
      await _firestoreRepo!.updateSubCategory(id: id, field: field);
      isEnglishName ? emit(SubCategoryItemState.enNameEdited(name)): emit(SubCategoryItemState.arNameEdited(name));
    } catch (e) {
      print(e);
      emit(SubCategoryItemState.error(e.toString()));
    }
  }

  Future deleteSubCategory(String id) async {
    emit(SubCategoryItemState.loading());
    try {
      await _firestoreRepo!.deleteSubCategory(id);

      emit(SubCategoryItemState.deleted());
      _subCategoriesNotifier.removeSubCategory();
    } catch (e) {
      emit(SubCategoryItemState.error(e.toString()));
      print(e);
    }
  }

  Future pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      emit(SubCategoryItemState.imagePicked(File(pickedFile.path)));
  }

  Future<Null> pickAndUpdateImage(String sectionId) async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    var imageFile = pickedImage != null ? File(pickedImage.path) : null;

    if (imageFile != null) {
      File? croppedImage = await CropImage.cropImage(File(pickedImage!.path));
      if (croppedImage != null) {
        try {
          final imageUrl = await _uploadAndUpdateImage(sectionId, croppedImage);
          emit(SubCategoryItemState.imageUpdated(imageUrl));
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future _uploadAndUpdateImage(String id, File image) async {
    try {
      String imageName = basename(image.path);
      final imageUrl = await _firebaseStorageRepo!.uploadImageToFirebase(imageName,image,'subCategories');
      await _firestoreRepo!.updateSubCategory(id: id,field: {'image':imageUrl,'image_name':imageName});
      return imageUrl;
    } catch (e) {
      print(e);
    }
  }


  Future uploadSubCategory(SubCategoryModel subCategory, File image) async {
    emit(SubCategoryItemState.loading());
    try {
      subCategory.imageId = basename(image.path);
      String imageUrl =
          await _firebaseStorageRepo!.uploadImageToFirebase(subCategory.imageId!,image, 'subCategories');
      subCategory.image = imageUrl;
      await _firestoreRepo!.addSubCategory(subCategory);

      emit(SubCategoryItemState.subCategoryUploaded(subCategory));
      _subCategoriesNotifier.addNewSubCategory(subCategory);
    } catch (e) {
      print(e);
    }


  }

  void closeImage(){
    emit(SubCategoryItemState.imageClosed());
  }
}
