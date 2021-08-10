import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_categories/main_categories.dart';
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';

import 'choose_category_state.dart';

class ChooseCategoryCubit extends Cubit<ChooseCategoryState> {
  ChooseCategoryCubit() : super(ChooseCategoryState.idle());
  final _firestoreRepo = getItInstance<FirestoreRepository>();
  late List<DocumentSnapshot> _documents;
  List<MainCategoryModel> _mainCategoriesList = [];
  List<SubCategoryModel> _subCategoriesList = [];
 late MainCategoryModel _chosenMainCategory;
 late SubCategoryModel _chosenSubCategory;

  void showMainCategories() async {
    // final categoriesCubit = getItInstance<CategoriesCubit>();

    if (_mainCategoriesList.isEmpty) {
      emit(ChooseCategoryState.loading());
      try {
        _documents = await _firestoreRepo.getMainCategories();
        _mainCategoriesList = List<MainCategoryModel>.generate(_documents.length,
            (index) => MainCategoryModel.fromJson(_documents[index]));
        List.generate(_mainCategoriesList.length, (index) {
          print(_mainCategoriesList[index].name);
        });
        print(_mainCategoriesList.length);
        emit(ChooseCategoryState.showMainCategories(_mainCategoriesList));
      } catch (e) {
        print('categories cubit error is $e');
      }
    } else {
      emit(ChooseCategoryState.showMainCategories(_mainCategoriesList));
    }
  }

  void showCategoriesDialogue(){
    emit(ChooseCategoryState.showCategoriesDialogue());
  }

  // void closeCategoriesDialogue(){
  //   emit(ChooseCategoryState.idle());
  // }

  void chooseMainCategory(MainCategoryModel mainCategory){
    _chosenMainCategory = mainCategory;
    emit(ChooseCategoryState.mainCategoryChosen(mainCategory));
  }

  void chooseSubCategory(SubCategoryModel subCategory , MainCategoryModel mainCategory){
    _chosenSubCategory = subCategory;
    emit(ChooseCategoryState.subCategoryChosen(
        _chosenMainCategory, _chosenSubCategory));
  }

  // void showSections(List<SectionModel> sections) {
  //   emit(ChooseCategoryState.showSections(sections));
  // }

  void showSubCategories(MainCategoryModel mainCategory) async {
    // if (_sectionsList.isEmpty) {
    emit(ChooseCategoryState.loading());
    try {
      _documents = await _firestoreRepo.getSubCategories(mainCategory.id);
      _subCategoriesList = List<SubCategoryModel>.generate(_documents.length,
          (index) => SubCategoryModel.fromJson(_documents[index].data()));
      List.generate(_subCategoriesList.length, (index) {
        print(_subCategoriesList[index].name);
      });
      print(_subCategoriesList.length);
      _chosenMainCategory = mainCategory;
      emit(ChooseCategoryState.showSubCategories(_subCategoriesList));
    } catch (e) {
      print('categories cubit error is $e');
    }
    // }
    // else
    //   emit(ChooseCategoryState.showSections(_sectionsList));
  }

  // void chooseCategory(SubCategoryModel subCategory) {
  //   _chosenSubCategory = subCategory;
  //   emit(ChooseCategoryState.categoriesChosen(
  //       _chosenMainCategory, _chosenSubCategory));
  // }
}
