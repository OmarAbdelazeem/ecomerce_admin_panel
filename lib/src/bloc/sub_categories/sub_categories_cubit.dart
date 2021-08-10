import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'sub_categories_state.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit() : super(SubCategoriesState.idle());
  late List<DocumentSnapshot> _documents;
  List<SubCategoryModel> _subCategoriesList = [];
  var _firestoreRepo = getItInstance<FirestoreRepository>();

  void fetchSubCategories(String categoryId) async {
    emit(SubCategoriesState.loading());
    try {
      _documents = await _firestoreRepo.getSubCategories(categoryId);
      _subCategoriesList = List<SubCategoryModel>.generate(_documents.length,
          (index) => SubCategoryModel.fromJson(_documents[index].data()));
      emit(SubCategoriesState.loaded(_subCategoriesList));
    } catch (e) {
      print('subCategories cubit error is $e');
      emit(SubCategoriesState.error(e.toString()));
    }
  }

  void addNewSubCategoryLocally(SubCategoryModel subCategory) {
    emit(SubCategoriesState.loading());
    _subCategoriesList.add(subCategory);
    emit(SubCategoriesState.loaded(_subCategoriesList));
  }

  void removeSubCategoryLocally(SubCategoryModel subCategory) {
    emit(SubCategoriesState.loading());
    _subCategoriesList.remove(subCategory);
    emit(SubCategoriesState.loaded(_subCategoriesList));
  }

}
