import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_tut/src/bloc/product_item/product_item.dart'
    as product_item;
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart'
    as choose_category;
import 'package:ecommerce_admin_tut/src/core/utils/confirmation_dialogue_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/bloc/banners/banners.dart' as banners;

import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/choose_category_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/confirmation_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/custom_changeable_cached_image.dart';
import 'package:ecommerce_admin_tut/src/ui/common/field_name.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  final bool isEnglishLanguage;

  ProductDetailsScreen({
    required this.product,
    required this.isEnglishLanguage,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final editProductCubit = getItInstance<product_item.ProductItemCubit>();
  Validator validator = Validator();
  final productsNotifierInstance = getItInstance<ProductsNotifier>();
  late StackRouter appRouter;
  final chooseCategoryCubit =
      getItInstance<choose_category.ChooseCategoryCubit>();
  final bannersCubit = getItInstance<banners.BannersCubit>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  // NameField? mainCategoryName;
  // NameField? subCategoryName;

  void deleteProduct()async{
    Future.delayed(Duration(milliseconds: 1)).then((value) => showLoadingDialog(context, _keyLoader));
   await editProductCubit
        .deleteProduct(widget.product.productId);


  }

  void closeDeletingDialogue(){
    Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return BlocConsumer<product_item.ProductItemCubit,
        product_item.ProductItemState>(
      listener: (BuildContext context, state) {
        state.when(
            submitted: (_) {},
            categoryDeleted: () {},
            deleting: () {
              deleteProduct();
            },
            imagePicked: (_) {},
            imageClosed: () {},
            idle: () {},
            fieldError: (_) {},
            fieldUpdated: (_) {},
            categoryUpdated: (NameField mainCategory, NameField subCategory) {
              // if (widget.product.categories.isEmpty) {
              //   widget.product.categories.add(mainCategory);
              //   widget.product.categories.add(subCategory);
              // } else {
              //   widget.product.categories[0] = mainCategory;
              //   widget.product.categories[1] = subCategory;
              // }
              //
            },
            imageUpdated: (image) {},
            productDeleted: () {
              closeDeletingDialogue();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(getTranslated(
                      context, StringsConstants.productDeletedSuccessfully)!)));
              appRouter.popUntil((route) => route.isFirst);
            },
            loading: () {},
            error: (_) {});
      },
      bloc: editProductCubit,
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.isEnglishLanguage
                ? widget.product.name.english
                : widget.product.name.arabic),
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showConfirmationDialogue(
                      context: context,
                      confirmationDialogueChoice:
                          ConfirmationDialogueOptions.deleteProduct,
                      yesFunction: deleteProduct);
                },
              )
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<product_item.ProductItemCubit,
                        product_item.ProductItemState>(
                      bloc: editProductCubit,
                      builder: (BuildContext context, state) {
                        return CustomChangeableCachedImage(
                            image: state is product_item.ImageUpdated
                                ? state.image
                                : widget.product.image!,
                            onChangeImagePressed: editProductCubit.pickAndUpdateImage);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.englishName,
                            value: widget.product.name.english));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.title,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.englishName,
                          fieldValue: widget.product.name.english),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.arabicName,
                            value: widget.product.name.arabic));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.title,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.arabicName,
                          fieldValue: widget.product.name.arabic),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.englishDescription,
                            value: widget.product.description!.english));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.description,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.englishDescription,
                          fieldValue:
                              widget.product.description!.english.isEmpty
                                  ? getTranslated(
                                      context, StringsConstants.noDescription)!
                                  : widget.product.description!.english),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.arabicDescription,
                            value: widget.product.description!.arabic));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.description,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.arabicDescription,
                          fieldValue: widget.product.description!.arabic.isEmpty
                              ? getTranslated(
                                  context, StringsConstants.noDescription)!
                              : widget.product.description!.arabic),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.currentPrice,
                            value: widget.product.price.toString()));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.currentPrice,
                          fieldValue: widget.product.price.toString()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.discountPrice,
                            value: widget.product.discountPrice.toString()));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.discountPrice,
                          fieldValue: widget.product.discountPrice.toString()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        appRouter.push(EditProductFieldScreen(
                            fieldName: StringsConstants.quantity,
                            value: widget.product.basicQuantity.toString()));
                      },
                      child: FieldName(
                          icon: Icon(
                            Icons.production_quantity_limits,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.quantity,
                          fieldValue: widget.product.basicQuantity.toString()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FieldName(
                        icon: Icon(
                          Icons.production_quantity_limits,
                          color: Colors.grey,
                        ),
                        fieldName: StringsConstants.numberOfSales,
                        fieldValue: widget.product.numberOfSales.toString()),
                    SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<choose_category.ChooseCategoryCubit,
                        choose_category.ChooseCategoryState>(
                      bloc: chooseCategoryCubit,
                      listener: (context, state) {
                        state.when(
                          mainCategoryChosen: (_) {},
                          showCategoriesDialogue: () {},
                          idle: () {},
                          loading: () {},
                          subCategoryChosen:
                              (MainCategoryModel chosenMainCategory,
                                  SubCategoryModel chosenSubCategory) {
                            editProductCubit.updateProductCategory(
                              chosenMainCategory.name,
                              chosenSubCategory.name,
                            );
                          },
                          showMainCategories: (_) {},
                          showSubCategories: (_) {},
                        );
                      },
                      builder: (context, state) {
                        if (state is choose_category.ShowCategoriesDialogue)
                          Future.delayed(Duration(milliseconds: 1)).then(
                              (value) => showCategoriesDialog(
                                  chooseCategoryCubit: chooseCategoryCubit,
                                  context: context));
                        return InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (_)=> AddProductCategoriesField(
                              //     categories: widget.product.categories
                              //     as List<NameField>,
                              //     productId: widget.product.productId)));
                            },
                            child: FieldName(
                                icon: Icon(
                                  Icons.production_quantity_limits,
                                  color: Colors.grey,
                                ),
                                fieldName: StringsConstants.categories,
                                fieldValue: widget.product.categories.isEmpty
                                    ? 'No categories'
                                    : '${(widget.isEnglishLanguage ? widget.product.categories[0].english : widget.product.categories[0].arabic) + ' , ' + (widget.isEnglishLanguage ? widget.product.categories[1].english : widget.product.categories[1].arabic)}'));
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      // onTap: showBannersDialogue,
                      child: FieldName(
                          icon: Icon(
                            Icons.production_quantity_limits,
                            color: Colors.grey,
                          ),
                          fieldName: StringsConstants.banners,
                          fieldValue: widget.product.basicQuantity.toString()),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

}

