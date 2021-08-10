import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main_categories_state.dart';

class MainCategoriesCubit extends Cubit<MainCategoriesState> {
  MainCategoriesCubit() : super(MainCategoriesState.idle());

  var _firestoreRepo = getItInstance<FirestoreRepository>();
 late List<DocumentSnapshot> _documents;
  List<MainCategoryModel> _mainCategoriesList = [];

  fetchCategories() async {
    emit(MainCategoriesState.loading());
    try {
      _documents = await _firestoreRepo.getMainCategories();
      _mainCategoriesList = List<MainCategoryModel>.generate(_documents.length,
          (index) => MainCategoryModel.fromJson(_documents[index]));
      print(_mainCategoriesList.length);
      emit(MainCategoriesState.loaded(_mainCategoriesList.toSet().toList()));

    } catch (e) {
      print('categories cubit error is $e');
      emit(MainCategoriesState.error(e));
    }
  }

  void addNewMainCategoryLocally(MainCategoryModel mainCategory){
    emit(MainCategoriesState.loading());
    _mainCategoriesList.add(mainCategory);
    emit(MainCategoriesState.loaded(_mainCategoriesList));
  }

  void removeMainCategoryLocally(MainCategoryModel mainCategory){
    emit(MainCategoriesState.loading());
    _mainCategoriesList.remove(mainCategory);
    emit(MainCategoriesState.loaded(_mainCategoriesList));
  }


}
