import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/core/utils/order_by_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/products_filter_options.dart';
import 'package:ecommerce_admin_tut/src/core/utils/products_sort_options.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/choose_category_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart'
    as choose_category;
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAndSortingProductsScreen extends StatefulWidget {
  @override
  _FilterAndSortingProductsScreenState createState() =>
      _FilterAndSortingProductsScreenState();
}

class _FilterAndSortingProductsScreenState
    extends State<FilterAndSortingProductsScreen> {
  final chooseCategoryCubit =
      getItInstance<choose_category.ChooseCategoryCubit>();
  final productsNotifier = getItInstance<ProductsNotifier>();
  final languageNotifier = getItInstance<LanguageNotifier>();
  late StackRouter appRouter;
  NameField? chosenCategory;
  ProductsFilterOptions? chosenFilterOption ;
  ProductsSortingOption? chosenSortingOption ;
  OrderByOption? chosenOrderOption;

  void doneButtonFunction() {
    productsNotifier.setFilterAndSortingOptions(chosenSortingOption!,
        chosenFilterOption!, chosenOrderOption!, chosenCategory);
    appRouter.pop();
    productsNotifier.reloadProducts();
  }

  resetFilterAndSorting() {
    setState(() {
      chosenCategory = null;
      chosenFilterOption = ProductsFilterOptions.All;
      chosenSortingOption = ProductsSortingOption.random;
      chosenOrderOption = OrderByOption.Descending;
    });

  }

  @override
  void initState() {
    chosenCategory = productsNotifier.chosenCategory ;
    chosenFilterOption =
        productsNotifier.filterOption ;
    chosenSortingOption =
        productsNotifier.sortOption ;
    chosenOrderOption =
        productsNotifier.orderOption ;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    appRouter = AutoRouter.of(context);
    return WillPopScope(
      onWillPop: () async {
        resetFilterAndSorting();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              getTranslated(context, StringsConstants.filteringAndSorting)!),
          actions: [
            IconButton(
              onPressed: showResetConfirmationDialogue,
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: doneButtonFunction,
              icon: Icon(Icons.done),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.filterBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.all,
                      value: ProductsFilterOptions.All,
                      initialValue: chosenFilterOption),
                  radioButton(
                      title: StringsConstants.unCategorized,
                      value: ProductsFilterOptions.UnCategorized,
                      initialValue: chosenFilterOption),
                  radioButton(
                      initialValue: chosenFilterOption,
                      value: ProductsFilterOptions.Category,
                      title: StringsConstants.category),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.sortBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.random,
                      value: ProductsSortingOption.random,
                      initialValue: chosenSortingOption),
                  radioButton(
                      initialValue: chosenSortingOption,
                      value: ProductsSortingOption.price,
                      title: StringsConstants.price),
                  radioButton(
                      value: ProductsSortingOption.date,
                      title: StringsConstants.date,
                      initialValue: chosenSortingOption),
                  radioButton(
                      initialValue: chosenSortingOption,
                      title: StringsConstants.bestSeller,
                      value: ProductsSortingOption.bestSeller),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getTranslated(context, StringsConstants.orderBy)!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  radioButton(
                      title: StringsConstants.descending,
                      value: OrderByOption.Descending,
                      initialValue: chosenOrderOption),
                  radioButton(
                      title: StringsConstants.ascending,
                      value: OrderByOption.Ascending,
                      initialValue: chosenOrderOption),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  radioButton(
      {required String title,
      required dynamic value,
      required dynamic initialValue}) {
    defaultRadioButton() {
      return InkWell(
        onTap: () {
          onRadioChanged(value);
        },
        child: ListTile(
          title: Text(getTranslated(context, title)!),
          leading: Radio(
            value: value,
            groupValue: initialValue,
            onChanged: onRadioChanged,
          ),
        ),
      );
    }

    categoryRadioButton() {
      return InkWell(
        onTap: () {
          onRadioChanged(value);
        },
        child: ListTile(
          title: Container(
            color: Colors.grey.shade100,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer(
                    bloc: chooseCategoryCubit,
                    builder:
                        (context, choose_category.ChooseCategoryState state) {
                      return Text(chosenCategory != null
                          ? languageNotifier.isEnglish
                              ? chosenCategory!.english
                              : chosenCategory!.arabic
                          : getTranslated(context, title)!);
                    },
                    listener:
                        (context, choose_category.ChooseCategoryState state) {
                      state.when(
                        idle: () {},
                        loading: () {},
                        showCategoriesDialogue: () {},
                        mainCategoryChosen: (chosenMainCategory) {
                          setState(() {
                            chosenCategory = chosenMainCategory.name;
                            chosenFilterOption = ProductsFilterOptions.Category;
                          });
                        },
                        subCategoryChosen: (MainCategoryModel mainCategory,
                            SubCategoryModel subCategory) {
                          setState(() {
                            chosenCategory = subCategory.name;
                            chosenFilterOption = ProductsFilterOptions.Category;
                          });
                        },
                        showMainCategories: (_) {},
                        showSubCategories: (_) {},
                      );
                    }),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          leading: Radio(
            value: value,
            groupValue: initialValue,
            onChanged: onRadioChanged,
          ),
        ),
      );
    }

    return value == ProductsFilterOptions.Category
        ? categoryRadioButton()
        : defaultRadioButton();
  }

  void onRadioChanged(dynamic value) {
    if (value == ProductsFilterOptions.Category) {
      showCategoriesDialog(
          context: context,
          chooseCategoryCubit: chooseCategoryCubit,
          isForFiltering: true);
    } else {
      setState(() {
        controlRadioButton(value);
      });
    }
  }

  void controlRadioButton(dynamic value) {
    if (value is ProductsSortingOption) {
      _controlSortingOptions(value);
    } else if (value is ProductsFilterOptions) {
      _controlFilteringOptions(value);
    } else if (value is OrderByOption) _controlOrderingOptions(value);
  }

  void _controlFilteringOptions(ProductsFilterOptions productsFilterOption) {
    chosenFilterOption = productsFilterOption;
    if (productsFilterOption == ProductsFilterOptions.UnCategorized) {
      chosenCategory = null;
    } else if (productsFilterOption == ProductsFilterOptions.All) {
      chosenCategory = null;
    }
  }

  void _controlSortingOptions(ProductsSortingOption productsSortingOptions) {
    chosenSortingOption = productsSortingOptions;
  }

  void _controlOrderingOptions(OrderByOption orderOptions) {
    chosenOrderOption = orderOptions;
  }

  Future showResetConfirmationDialogue() {
    return showDialog<bool>(
        context: context,
        builder: (dialogueContext) {
          return AlertDialog(
            title: Text(getTranslated(
                context, StringsConstants.resetFilteringAndSorting)!),
            content: Text(getTranslated(
                context, StringsConstants.resetFilteringAndSortingMessage)!),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(dialogueContext);
                  },
                  child: Text(getTranslated(context, StringsConstants.no)!)),
              TextButton(
                  onPressed: () {
                    resetFilterAndSorting();
                    productsNotifier.resetFilteringAndSorting();
                    Navigator.pop(dialogueContext);

                  },
                  child: Text(getTranslated(context, StringsConstants.yes)!))
            ],
          );
        });
  }
}
