import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/provider_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/select_banner_products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:ecommerce_admin_tut/src/ui/common/products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products.dart'
    as products;

class BannerProducts extends StatefulWidget {
  final NameField bannerName;
  final bool isEnglish;
  BannerProducts({required this.bannerName , required this.isEnglish});

  @override
  _BannerProductsState createState() => _BannerProductsState();
}

class _BannerProductsState extends State<BannerProducts> {
  final productsCubit = getItInstance<products.ProductsCubit>();
  final selectBannerProductsNotifierInstance =
      getItInstance<SelectBannerProductsNotifier>();
  late StackRouter appRouter;

  @override
  void initState() {
    productsCubit.fetchBannerProducts(widget.bannerName.toJson()!);
    super.initState();
  }

  @override
  void dispose() {
    selectBannerProductsNotifierInstance.backToDefault();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEnglish ? widget.bannerName.english : widget.bannerName.arabic),
        actions: [
          DropdownButton<String>(
            elevation: 16,
            underline: Container(),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
            items: [
              DropdownMenuItem(
                value: StringsConstants.remove,
                child: Text(
                  getTranslated(context, StringsConstants.remove)!,
                ),
              ),
              DropdownMenuItem(
                value: StringsConstants.add,
                child: Text(
                  getTranslated(context, StringsConstants.add)!,
                ),
              )
            ],
            onChanged: (v) {
              if (v == StringsConstants.remove) {
                selectBannerProductsNotifierInstance.selectProducts();
              } else {
                appRouter
                    .push(SelectingProducts(bannerName: widget.bannerName));
                selectBannerProductsNotifierInstance.backToDefault();
              }

              print('value is $v');
            },
          )
        ],
      ),
      body: Stack(
        children: [
          ProviderNotifier(child:
              (SelectBannerProductsNotifier selectBannerProductsNotifier) {
            if (selectBannerProductsNotifier.productsAdded) {
              productsCubit.addProductsLocally(
                  selectBannerProductsNotifier.selectedProducts);
              selectBannerProductsNotifierInstance.backToDefault();
            }
            return Stack(
              children: [

                Column(
                  children: [
                    selectBannerProductsNotifier.productCanBeSelected ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '${selectBannerProductsNotifier.selectedProducts.length} ${getTranslated(context, StringsConstants.selected)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ) : Container(),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: productsDataBuilder(
                            productsCubit: productsCubit,
                            productCanBeSelected:
                                selectBannerProductsNotifier.productCanBeSelected)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                selectBannerProductsNotifier.productCanBeSelected
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: BlocConsumer<products.ProductsCubit,
                                products.ProductsState>(
                              bloc: productsCubit,
                              listener: (context, state) {
                                state.when(
                                    idle: () {},
                                    sort: () {},
                                    loaded: (_) {},
                                    filter: () {},
                                    error: (_) {},
                                    loading: () {},
                                    finished: () {
                                      productsCubit.removeProducts(
                                          selectBannerProductsNotifier
                                              .selectedProducts);
                                      selectBannerProductsNotifier
                                          .backToDefault();
                                    });
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    productsCubit.removeBannerProducts(
                                        widget.bannerName,
                                        selectBannerProductsNotifier
                                            .selectedProducts);
                                  },
                                  child: Text(getTranslated(context, StringsConstants.done)!),
                                );
                              },
                            ),
                          ),
                        ))
                    : Container()
              ],
            );
          }),
        ],
      ),
    );
  }
}
