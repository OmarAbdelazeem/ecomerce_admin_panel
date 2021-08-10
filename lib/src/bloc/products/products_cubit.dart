import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products_state.dart';
import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/products_sort_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/repository/algolia_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  var _firestoreRepo = getItInstance<FirestoreRepository>();
  var _algoliaRepo = getItInstance<AlgoliaRepository>();

  ProductsCubit() : super(ProductsState.idle());
  late List<DocumentSnapshot> _documents;
  List<ProductModel>? _productList;
  late Stream productsQuerySnapshot;

  String? _getSortCondition(ProductsSortingOption? productsSortingOption) {
    // ignore: missing_enum_constant_in_switch
    switch (productsSortingOption) {
      case ProductsSortingOption.price:
        return 'price';

      case ProductsSortingOption.date:
        return 'date';

      case ProductsSortingOption.bestSeller:
        return 'number_of_sales';
    }
  }

  fetchNextList([String? condition]) async {
    try {
      List<DocumentSnapshot> docs = await _firestoreRepo.getProducts(
          documentSnapshot: _documents[_documents.length - 1]);

      _documents.addAll(docs);
      _productList = List<ProductModel>.generate(_documents.length,
              (index) => ProductModel.fromJson(_documents[index].data()));
      List.generate(_productList!.length, (index) {
        print(_productList![index].name);
      });
      print(_productList!.length);
      emit(ProductsState.loaded(_productList!.toSet().toList()));
    } catch (e) {
      print(e);
      emit(ProductsState.error(
        e.toString(),
      ));
    }
  }

  searchForProduct(String? productName) async {
    try {
      if (productName != null && productName.isNotEmpty) {
        print('productName is $productName');
        if (TrimName
            .trimSearchName(productName)
            .isNotEmpty) {
          emit(ProductsState.loading());
          _algoliaRepo.searchForProduct(productName).listen((products) {
            List<ProductModel> list =
            List<ProductModel>.generate(products.hits.length, (index) {
              ProductModel productModel =
              ProductModel.fromJson(products.hits[index].data);
              return productModel;
            });
            emit(ProductsState.loaded(list));
          });
        }
      } else
        emit(ProductsState.loaded([]));
    } catch (e) {
      print(e.toString());
      emit(ProductsState.error(e.toString()));
    }
  }

  void fetchBannerProducts(Map banner) async {
    emit(ProductsState.loading());
    try {
      List productsDocs = await _firestoreRepo.getBannerProducts(banner);
      _productList = List<ProductModel>.generate(productsDocs.length,
              (index) => ProductModel.fromJson(productsDocs[index].data()));

      emit(ProductsState.loaded(_productList!));
    } catch (e) {
      print(e);
    }
  }

  void addBannerToProducts(NameField bannerName,
      List<ProductModel> selectedProducts) {
    emit(ProductsState.loading());
    try {
      selectedProducts.forEach((product) async {
        await _firestoreRepo.addBannerProduct(product.productId, bannerName);
      });
      emit(ProductsState.finished());
    } catch (e) {
      print('error from banner products is $e');
    }
  }

  // void removeProduct(ProductModel product) {
  //   emit(ProductsState.loading());
  //   _productList.remove(product);
  //   emit(ProductsState.loaded(_productList));
  // }

  void removeBannerProducts(NameField bannerName,
      List<ProductModel> selectedProducts) async {
    emit(ProductsState.loading());
    try {
      selectedProducts.forEach((product) async {
        await _firestoreRepo.removeBannerProduct(product.productId, bannerName);
      });
      emit(ProductsState.finished());
    } catch (e) {
      print('error from banner products is $e');
    }
  }

  void removeProducts(List<ProductModel> products) {
    emit(ProductsState.loading());
    // print(ids.length);
    print(_productList!.length);
    // products.forEach((ProductModel removedProduct) {
    //   _productList.removeWhere((ProductModel product) => product == removedProduct);
    // });

    products.forEach((ProductModel removedProduct) {
      // _productList.remove((ProductModel product) => product == removedProduct);
      _productList!.remove(removedProduct);
    });

    emit(ProductsState.loaded(_productList!));
  }

  void addProductsLocally(List<ProductModel> products) {
    emit(ProductsState.loading());
    products.forEach((product) {
      _productList!.add(product);
    });
    emit(ProductsState.loaded(_productList!));
  }

  void updateProduct(ProductModel updatedProduct) {
    int index = _productList!
        .indexWhere((product) => product.productId == updatedProduct.productId);
    if (index >= 0) _productList![index] = updatedProduct;
  }

  Future fetchProducts({bool isUnCategorized = false,
    Map<String?, String?>? category,
    ProductsSortingOption? sortingOption,
    OrderByOption? orderOption = OrderByOption.Ascending}) async {
    _productList = [];

    bool descending = false;

    orderOption == OrderByOption.Descending
        ? descending = true
        : descending = false;

    String? sortCondition;

    emit(ProductsState.loading());

    sortCondition = _getSortCondition(sortingOption);

    try {
      if (category != null) {
        _documents = await _firestoreRepo.getProducts(
            filterCondition: {'key': 'categories', 'value': category},
            sortCondition: sortCondition,
            descending: descending);
      } else if (isUnCategorized) {
        _documents = await _firestoreRepo.getProducts(
            isUnCategorized: true,
            sortCondition: sortCondition,
            descending: descending);
      } else {
        _documents = await _firestoreRepo.getProducts(
            sortCondition: sortCondition, descending: descending);
      }
      _productList = List<ProductModel>.generate(_documents.length,
              (index) => ProductModel.fromJson(_documents[index].data()));

          emit(ProductsState.loaded(_productList!));


    } catch (e) {
    print('error from get products is $e');
    emit(ProductsState.error(e.toString()));
    }
  }

  fetchNotBannerProducts(NameField bannerName) {
    emit(ProductsState.loading());
    try {
      productsQuerySnapshot = _firestoreRepo.fetchNotBannerProducts(bannerName);
      productsQuerySnapshot.listen((event) {
        List<ProductModel> list = [];
        list = List<ProductModel>.generate(event
            .toList()
            .length, (index) {
          return ProductModel.fromJson(event.toList()[index].data());
        });
        emit(ProductsState.loaded(list));
      });
    } catch (e) {}
  }
}
