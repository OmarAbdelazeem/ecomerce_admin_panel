import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/crop_image.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';

import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/firebase_storage_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'product_item_state.dart';
import 'package:path/path.dart';

class ProductItemCubit extends Cubit<ProductItemState> {
  ProductItemCubit() : super(ProductItemState.idle());
  final _fireStoreRepo = getItInstance<FirestoreRepository>();
  final _productsNotifier = getItInstance<ProductsNotifier>();
  final FirebaseStorageRepository? _firebaseStorageRepo =
      getItInstance<FirebaseStorageRepository>();

  void updateProductField(
      {required String value, required String fieldName}) async {
    print('product is ${_productsNotifier.product}');
    // if product name remmeber to change name search
    emit(ProductItemState.loading());
    late String mFieldName;
    late dynamic mValue;
    if (fieldName == StringsConstants.englishName) {
      mFieldName = 'name.en';
      mValue = value;
    } else if (fieldName == StringsConstants.arabicName) {
      mFieldName = 'name.ar';
      mValue = value;
      mValue = value;
    } else if (fieldName == StringsConstants.englishDescription) {
      mFieldName = 'description.en';
      mValue = value;
    }else if (fieldName == StringsConstants.arabicDescription) {
      mFieldName = 'description.ar';
      mValue = value;
    } else if (fieldName == StringsConstants.quantity) {
      mFieldName = StringsConstants.quantity;
      mValue = int.parse(value);
    } else if (fieldName == StringsConstants.currentPrice) {
      mFieldName = StringsConstants.currentPrice;
      mValue = double.parse(value);
    } else if (fieldName == StringsConstants.discountPrice) {
      mFieldName = StringsConstants.discountPrice;
      mValue = double.parse(value);
      if (_productsNotifier.product!.price < mValue) {
        emit(ProductItemState.fieldError(StringsConstants.discountPriceError));
        return;
      }
    }

    try {
      print(
          'mFieldName is ${mFieldName} mValue is $mValue _productsNotifier.product!.productId is ${_productsNotifier.product!.productId}');
      await _fireStoreRepo.updateProduct(
          field: {mFieldName: mValue},
          id: _productsNotifier.product!.productId);

      _productsNotifier.updateProductValue(fieldName: fieldName, value: mValue);

      emit(ProductItemState.fieldUpdated(mValue));
    } catch (e) {
      print(e.toString());
      emit(ProductItemState.error(e.toString()));
    }
  }

  Future<Null> pickAndUpdateImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    var imageFile = pickedImage != null ? File(pickedImage.path) : null;

    if (imageFile != null) {
      File? croppedImage = await CropImage.cropImage(File(pickedImage!.path));
      if (croppedImage != null) {
        try {
          final imageUrl = await _uploadAndUpdateImage(croppedImage);

          _productsNotifier.updateProductValue(
              fieldName: StringsConstants.image, value: imageUrl);
          emit(ProductItemState.imageUpdated(imageUrl));
        } catch (e) {
          print(e);
        }
      }
    }
  }

  Future _uploadAndUpdateImage(File image) async {
    try {
      String imageName = basename(image.path);
      final imageUrl = await _firebaseStorageRepo!
          .uploadImageToFirebase(imageName, image, 'products');
      await _fireStoreRepo.updateProduct(
          field: {'image_name': imageName, 'image': imageUrl},
          id: _productsNotifier.product!.productId);
      return imageUrl;
    } catch (e) {
      print(e);
    }
  }

  Future deleteProduct(String id) async {
    emit(ProductItemState.deleting());
    try {
      await _fireStoreRepo.deleteProduct(id);

      emit(ProductItemState.productDeleted());

      _productsNotifier.removeProduct();
    } catch (e) {
      print(e);
    }
  }

  void updateProductCategory(
    NameField mainCategory,
    NameField subCategory,
  ) async {
    print('updateProductCategory');
    emit(ProductItemState.loading());
    try {
      await _fireStoreRepo.updateProduct(field: {
        'categories': [mainCategory.toJson(), subCategory.toJson()],
        'sub_category': subCategory.toJson()
      }, id: _productsNotifier.product!.productId);
      emit(ProductItemState.fieldUpdated([mainCategory, subCategory]));
      // emit(EditProductState.categoryUpdated( mainCategory:mainCategory,subCategory: subCategory ));
    } catch (e) {
      print('error from edit product cubit is $e');
    }
  }

  // void deleteProductCategory(String productId)async{
  //   print('delete product category');
  //   emit(EditProductState.loading());
  //   print('product id is $productId');
  //   try{
  //     await _fireStoreRepo.updateProduct(field: {
  //       'categories': [],
  //       'sub_category': null
  //     }, id: productId);
  //     emit(EditProductState.categoryDeleted());
  //   }catch(e){
  //     print('error from edit product cubit is $e');
  //   }
  // }

  Future uploadProduct(ProductModel product, File imageFile) async {
    try {
      if (product.price < product.discountPrice) {
        emit(ProductItemState.fieldError(StringsConstants.discountPriceError));
        return;
      }
      emit(ProductItemState.loading());
      product.imageId = basename(imageFile.path);
      String image = await _firebaseStorageRepo!
          .uploadImageToFirebase(product.imageId!, imageFile, 'products');
      product.image = image;
      product.numberOfSales = 0;
      await _fireStoreRepo.uploadProduct(product);
      emit(ProductItemState.submitted(product));
      _productsNotifier.addProduct(product);
    } catch (e) {
      print('from addProductCubit addProduct func error is $e');
      emit(ProductItemState.error(e.toString()));
    }
  }

  Future pickImage() async {
    final picker = ImagePicker();
    PickedFile? pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      emit(ProductItemState.imagePicked(File(pickedFile.path)));
  }

  void closeImage() {
    emit(ProductItemState.imageClosed());
  }
}
