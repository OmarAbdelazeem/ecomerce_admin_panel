import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/select_banner_products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/products_builder.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products.dart'
    as products;
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectingProducts extends StatefulWidget {
  final NameField bannerName;

  SelectingProducts({required this.bannerName});

  @override
  _SelectingProductsState createState() => _SelectingProductsState();
}

class _SelectingProductsState extends State<SelectingProducts> {
  var productsCubit = getItInstance<products.ProductsCubit>();

  var selectBannerProductsNotifierInstance =
      getItInstance<SelectBannerProductsNotifier>();
  late StackRouter appRouter;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    productsCubit.fetchNotBannerProducts(widget.bannerName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, StringsConstants.selectingProducts)!),
        actions: [
          IconButton(
              onPressed: () {
                productsCubit.addBannerToProducts(widget.bannerName,
                    selectBannerProductsNotifierInstance.selectedProducts);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: BlocConsumer<products.ProductsCubit, products.ProductsState>(
        bloc: productsCubit,
        listener: (context, state) {
          state.when(
              error: (_) {},
              filter: () {},
              loaded: (_) {},
              sort: () {},
              idle: () {},
              loading: () {
              },
              finished: () {
                appRouter.pop();
                selectBannerProductsNotifierInstance.setAddedProducts();
              });
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 if(state is products.Loaded && state.products.isNotEmpty)
                   ProviderNotifier(child: (SelectBannerProductsNotifier
                   selectBannerProductsNotifier) {
                     return Padding(
                       padding: const EdgeInsets.all(12.0),
                       child: Text(
                         '${selectBannerProductsNotifier.selectedProducts.length} ${getTranslated(context, StringsConstants.selected)}',
                         style: TextStyle(fontSize: 18),
                       ),
                     );
                   }),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: productsDataBuilder(
                          productsCubit: productsCubit,
                          productCanBeSelected:
                          true)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

}
