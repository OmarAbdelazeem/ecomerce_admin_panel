import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/bloc/product_item/product_item.dart'
    as product_item;
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart'
    as choose_category;
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/utils/trim_name.dart';
import 'package:ecommerce_admin_tut/src/core/utils/validator.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';

import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/product_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/add_image.dart';
import 'package:ecommerce_admin_tut/src/ui/common/choose_category_dialogue.dart';
import 'package:ecommerce_admin_tut/src/ui/common/custom_text_field.dart';
import 'package:ecommerce_admin_tut/src/ui/common/loading_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final productItemCubit = getItInstance<product_item.ProductItemCubit>();
  final chooseCategoryCubit =
      getItInstance<choose_category.ChooseCategoryCubit>();
  final languageNotifier = getItInstance<LanguageNotifier>();
  final GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  TextEditingController enNameController = TextEditingController();
  TextEditingController arNameController = TextEditingController();
  TextEditingController enDescriptionController = TextEditingController();
  TextEditingController arDescriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController basicQuantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  final productsNotifier = getItInstance<ProductsNotifier>();
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
  NameField? chosenMainCategory;
  NameField? chosenSubCategory;
  Validator validator = Validator();
  File? imageFile;
  late StackRouter appRouter;

  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, StringsConstants.addProduct)!),
      ),
      body: BlocConsumer<product_item.ProductItemCubit,
          product_item.ProductItemState>(
        bloc: productItemCubit,
        listener: (context, state) {
          state.when(
            deleting: () {},
            categoryDeleted: () {},
            idle: () {},
            productDeleted: () {},
            fieldUpdated: (_) {},
            fieldError: (_) {},
            categoryUpdated: (_, __) {},
            loading: () {

            },
            imageClosed: () {
              imageFile = null;
            },
            imagePicked: (File pickedImage) {
              imageFile = pickedImage;
            },
            submitted: (ProductModel product) {
              appRouter.pop();
              imageFile = null;
              clearTextFields();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(getTranslated(
                      context, StringsConstants.productAddedSuccessfully)!),
                ),
              );
            },
            error: (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e),
                ),
              );
            },
            imageUpdated: (_) {},
          );
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 20, right: 20, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddImage(
                      imageFile: imageFile,
                      closeImageFunction: productItemCubit.closeImage,
                      pickImageFunction: productItemCubit.pickImage,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            controller: enNameController,
                            hintText: StringsConstants.englishName,
                            validationFunction: validator.validateEnglishName,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: StringsConstants.arabicName,
                            controller: arNameController,
                            validationFunction: validator.validateArabicName,
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: StringsConstants.englishDescription,
                            controller: enDescriptionController,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: StringsConstants.arabicDescription,
                            controller: arDescriptionController,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            keyBoardType: TextInputType.number,
                            controller: priceController,
                            validationFunction: validator.validatePrice,
                            hintText: StringsConstants.price,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: StringsConstants.discountPrice,
                            controller: discountPriceController,
                            validationFunction:
                                validator.validateDiscountPrice,
                            keyBoardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (state is product_item.FieldError)
                            Text(
                              getTranslated(context, state.error)!,
                              style: TextStyle(color: Colors.red),
                            ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: StringsConstants.quantity,
                            controller: basicQuantityController,
                            keyBoardType: TextInputType.number,
                            validationFunction: validator.validateQuantity,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BlocBuilder<choose_category.ChooseCategoryCubit,
                              choose_category.ChooseCategoryState>(
                            bloc: chooseCategoryCubit,
                            builder: (context, state) {
                              if (state
                                  is choose_category.SubCategoryChosen) {
                                Future.delayed(Duration(milliseconds: 1)).then((value){
                                  categoryController.text = languageNotifier
                                      .isEnglish
                                      ? '${state.chosenMainCategory.name.english + ' , ' + state.chosenSubCategory.name.english}'
                                      : '${state.chosenMainCategory.name.arabic + ' , ' + state.chosenSubCategory.name.arabic}';
                                  chosenMainCategory =
                                      state.chosenMainCategory.name;
                                  chosenSubCategory =
                                      state.chosenSubCategory.name;
                                });
                              }

                              return CustomTextField(
                                hintText: StringsConstants.category,
                                controller: categoryController,
                                readOnly: true,
                                validationFunction:
                                    validator.validateCategory,
                                onTap: () async {
                                  await showCategoriesDialog(
                                    context: context,
                                    chooseCategoryCubit: chooseCategoryCubit,
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 40,
                            child: RaisedButton(
                              onPressed: submitButton,
                              color: Colors.blue,
                              child: Text(
                                getTranslated(
                                    context, StringsConstants.submit)!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void clearTextFields() {
    enNameController.clear();
    arNameController.clear();
    enDescriptionController.clear();
    arDescriptionController.clear();
    priceController.clear();
    discountPriceController.clear();
    basicQuantityController.clear();
    categoryController.clear();
  }

  void submitButton() async {
    if (_formKey!.currentState!.validate()) {
      if (imageFile == null)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(getTranslated(
                context, StringsConstants.youMustProvideAnImage)!)));
      else {
        final product = ProductModel(
          numberOfSales: 0,
          date: DateTime.now().toIso8601String(),
          name: NameField(
            arabic: TrimName.trimName(arNameController.text),
            english: TrimName.trimName(enNameController.text),
          ),
          description: NameField(
              english: TrimName.trimName(enDescriptionController.text),
              arabic: TrimName.trimName(arDescriptionController.text)),
          subCategory: chosenSubCategory!,
          categories: [
            NameField(
                arabic: chosenMainCategory!.arabic,
                english: chosenMainCategory!.english),
            NameField(
                arabic: chosenSubCategory!.arabic,
                english: chosenSubCategory!.english)
          ],
          basicQuantity: int.parse(basicQuantityController.text),
          remainQuantity: int.parse(basicQuantityController.text),
          price: double.parse(priceController.text),
          discountPrice: discountPriceController.text.isNotEmpty
              ? double.parse(discountPriceController.text)
              : double.parse(priceController.text),
          productId: Uuid().v4(),
        );
        showLoadingDialog(context, _keyLoader);
       await productItemCubit.uploadProduct(product, imageFile!);
        Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
      }
    }
  }

}
