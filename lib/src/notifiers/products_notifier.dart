import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/products_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/products_sort_options.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:flutter/cupertino.dart';

class ProductsNotifier extends ChangeNotifier {
  late ProductModel? _product;
  bool _isProductRemoved = false;
  bool _isProductUpdated = false;
  bool _isProductAdded = false;
  bool _isUnCategorized = false;

  // variable for filtering and sorting products

  ProductsSortingOption? _sortOption = ProductsSortingOption.random;

  ProductsFilterOptions? _filterOption = ProductsFilterOptions.All;

  OrderByOption? _orderOption = OrderByOption.Descending;

  NameField? _chosenCategory;

  bool _shouldReload = false;

  void reloadProducts() {
    _shouldReload = true;
    notifyListeners();
  }

  void removeProduct() {
    _isProductRemoved = true;
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    _product = product;
    _isProductAdded = true;
    notifyListeners();
  }

  setFilterAndSortingOptions(
      ProductsSortingOption sortOption,
      ProductsFilterOptions filterOption,
      OrderByOption orderOption,
      NameField? chosenCategory) {
    _sortOption = sortOption;
    _filterOption = filterOption;
    _orderOption = orderOption;
    _chosenCategory = chosenCategory;

    if (filterOption == ProductsFilterOptions.All ||
        filterOption == ProductsFilterOptions.Category)
      _isUnCategorized = false;
    else
      _isUnCategorized = true;

    notifyListeners();
  }

  void backToDefault() {
    _isProductRemoved = false;
    _isProductUpdated = false;
    _isProductAdded = false;
    _shouldReload = false;
  }

  void resetFilteringAndSorting() {
    _sortOption = ProductsSortingOption.random;
    _filterOption = ProductsFilterOptions.All;
    _orderOption = OrderByOption.Descending;
    _chosenCategory = null;
    _isUnCategorized = false;
  }

  void setCurrentProduct(ProductModel product) {
    _product = product;
  }

  void updateProductValue({required String fieldName, required dynamic value}) {
    switch (fieldName) {
      case StringsConstants.arabicName:
        _product!.name.arabic = value;
        break;
      case StringsConstants.englishName:
        _product!.name.english = value;
        break;
      case StringsConstants.quantity:
        _product!.basicQuantity = value;
        break;
      case StringsConstants.englishDescription:
        _product!.description!.english = value;
        break;
      case StringsConstants.arabicDescription:
        _product!.description!.arabic = value;
        break;
      case StringsConstants.currentPrice:
        _product!.price = value;
        break;
      case StringsConstants.discountPrice:
        _product!.discountPrice = value;
        break;
      case StringsConstants.image:
        _product!.image = value;
        break;
      case StringsConstants.categories:
        _product!.categories = value;
        _product!.subCategory = value[1];
        break;
    }
    _isProductUpdated = true;
    notifyListeners();
  }

  get isProductRemoved => _isProductRemoved;

  get isProductUpdated => _isProductUpdated;

  get isProductAdded => _isProductAdded;

  ProductModel? get product => _product;

  get shouldReload => _shouldReload;

  get sortOption => _sortOption;

  get isUnCategorized => _isUnCategorized;

  get orderOption => _orderOption;

  get chosenCategory => _chosenCategory;

  get filterOption => _filterOption;
}
