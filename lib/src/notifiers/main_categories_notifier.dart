import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:flutter/cupertino.dart';

class MainCategoriesNotifier with ChangeNotifier {
  bool _isMainCategoryRemoved = false;
  bool _isMainCategoryAdded = false;
  MainCategoryModel? _mainCategory;

  void removeMainCategory() {
    _isMainCategoryRemoved = true;
    notifyListeners();
  }

  void setCurrentMainCategory(MainCategoryModel mainCategory){
    _mainCategory = mainCategory;
  }

  void addMainCategory(MainCategoryModel mainCategory) {
    _mainCategory = mainCategory;
    _isMainCategoryAdded = true;
  }

  void backToDefault() {
    _isMainCategoryRemoved = false;
    _isMainCategoryAdded = false;
    _mainCategory = null;
  }

  get isMainCategoryRemoved => _isMainCategoryRemoved;

  get isMainCategoryAdded => _isMainCategoryAdded;

  get mainCategory => _mainCategory;
}
