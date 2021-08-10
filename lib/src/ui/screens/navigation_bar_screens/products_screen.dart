import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products.dart'
as products;
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';

import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/products_builder.dart';
import 'package:flutter/material.dart';


class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  var productsCubit = getItInstance<products.ProductsCubit>();

  var productsNotifier = getItInstance<ProductsNotifier>();

  late StackRouter appRouter;

  @override
  void initState() {
    fetchProducts();
    // scrollController.addListener(_scrollListener);
    super.initState();
  }

  // void _scrollListener() {
  //   if (scrollController.offset >= scrollController.position.maxScrollExtent &&
  //       !scrollController.position.outOfRange) {
  //     // print("at the end of list");
  //     productsCubit.fetchNextList();
  //   }
  // }


  Future fetchProducts() {
    return  productsCubit.fetchProducts(
          category: productsNotifier.chosenCategory?.toJson(),
          isUnCategorized: productsNotifier.isUnCategorized,
          sortingOption: productsNotifier.sortOption,
          orderOption: productsNotifier.orderOption);
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);

    return Scaffold(
        body: Column(
          children: [
            ProviderNotifier(child: (ProductsNotifier productsNotifier) {
              if (productsNotifier.isProductRemoved)
                productsCubit.removeProducts([productsNotifier.product!]);
              else if (productsNotifier.isProductUpdated)
                productsCubit.updateProduct(productsNotifier.product!);
              else if (productsNotifier.isProductAdded)
                productsCubit.addProductsLocally([productsNotifier.product!]);

              else if (productsNotifier.shouldReload)
                fetchProducts();
              productsNotifier.backToDefault();
              return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.9,
                  child: productsDataBuilder(
                      productsCubit: productsCubit, productCanBeEdited: true));
            })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: '1',
          child: Icon(Icons.add),
          onPressed: () {
            appRouter.push(AddProductScreen());
          },
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

