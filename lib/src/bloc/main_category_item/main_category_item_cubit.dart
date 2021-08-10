import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_category_item/main_category_item_state.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/main_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';

class MainCategoryItemCubit extends Cubit<MainCategoryItemState> {
  MainCategoryItemCubit() : super(MainCategoryItemState.idle());
  final _firestoreRepo = getItInstance<FirestoreRepository>();
  final _mainCategoriesNotifier =  getItInstance<MainCategoriesNotifier>();
  // void editCategory() {
  //   emit(MainCategoryItemState.editing());
  // }

  Future uploadCategory(MainCategoryModel category) async {
    emit(MainCategoryItemState.loading());
    try {
      await _firestoreRepo.uploadMainCategory(category);
      emit(MainCategoryItemState.uploaded(category));
      _mainCategoriesNotifier.addMainCategory(category);
    } catch (e) {
      print(e);
    }
  }

  Future updateCategoryName(
      {required String name,
      required String id,
      required bool isEnglish}) async {
    emit(MainCategoryItemState.loading());
    try {
      await _firestoreRepo.updateMainCategoryName(name, id, isEnglish);
      isEnglish
          ? emit(MainCategoryItemState.enNameEdited(name))
          : emit(MainCategoryItemState.arNameEdited(name));
      return true;
    } catch (e) {
      print('category_item cubit updateCategoryName error is $e');
      emit(MainCategoryItemState.error(e.toString()));
      return false;
    }
  }

  Future deleteMainCategory(String categoryId) async {
    emit(MainCategoryItemState.loading());
    try {
      await _firestoreRepo.deleteMainCategory(categoryId);
      _mainCategoriesNotifier.removeMainCategory();
      emit(MainCategoryItemState.deleted());
    } catch (e) {
      print('category_item cubit deleteCategory error is $e');
      emit(MainCategoryItemState.error(e.toString()));
    }
  }
}
