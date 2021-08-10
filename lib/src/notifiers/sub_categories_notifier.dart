import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:flutter/cupertino.dart';

class SubCategoriesNotifier extends ChangeNotifier {
  bool _isSubCategoryRemoved = false;
  bool _isNewSubCategoryAdded = false;
  SubCategoryModel? _subCategory;


  void removeSubCategory() {
    _isSubCategoryRemoved = true;
    notifyListeners();
  }

  void setCurrentSubCategory(SubCategoryModel subCategory){
    _subCategory = subCategory;
  }


  void addNewSubCategory(SubCategoryModel subCategory){
    _subCategory = subCategory;
    _isNewSubCategoryAdded = true;
    notifyListeners();
  }


  void backToDefault() {
    _isSubCategoryRemoved = false;
    _isNewSubCategoryAdded = false;
  }

  get isSubCategoryRemoved => _isSubCategoryRemoved;

  get isNewSubCategoryAdded => _isNewSubCategoryAdded;

  get subCategory => _subCategory;
}
