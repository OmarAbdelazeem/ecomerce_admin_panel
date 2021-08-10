import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class SelectBannerProductsNotifier with ChangeNotifier {
  late List<ProductModel> _selectedProducts = [];
  bool _productCanBeSelected = false;
  bool _productsAdded = false;

  addProduct(ProductModel product) {
    _selectedProducts.add(product);
    notifyListeners();
  }

  removeProduct(ProductModel product) {
    _selectedProducts.remove(product);
    notifyListeners();
  }

  selectProducts() {
    _productCanBeSelected = true;
    notifyListeners();
  }

  setAddedProducts() {
    _productsAdded = true;
    notifyListeners();
  }

  backToDefault() {
    _productCanBeSelected = false;
    _productsAdded = false;
    _selectedProducts = [];
    notifyListeners();
  }

  List<ProductModel> get selectedProducts => _selectedProducts;

  bool get productCanBeSelected => _productCanBeSelected;

  bool get productsAdded => _productsAdded;
}
