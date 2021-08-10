import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/di/app_injector.dart';
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> showCategoriesDialog(
    {required ChooseCategoryCubit chooseCategoryCubit,
    required BuildContext context,
    bool isForFiltering = false,}) async {

  chooseCategoryCubit.showMainCategories();

  final languageNotifier = getItInstance<LanguageNotifier>();

  late MainCategoryModel currentMainCategory;

  Widget subCategoriesBuilder({
    required List<SubCategoryModel> subCategories,
  }) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: subCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubCategoryItem(
                subCategory: subCategories[index],
                isEnglish: languageNotifier.isEnglish,
                onTap: () {
                  chooseCategoryCubit.chooseSubCategory(subCategories[index] , currentMainCategory);
                },
              ));
        },
      ),
    );
  }

  Widget mainCategoriesBuilder({
    required List<MainCategoryModel> mainCategories,
  }) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: mainCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              currentMainCategory = mainCategories[index];
              chooseCategoryCubit.showSubCategories(mainCategories[index]);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '${languageNotifier.isEnglish ? mainCategories[index].name.english : mainCategories[index].name.arabic}'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        );
      },
    );
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return BlocBuilder<ChooseCategoryCubit, ChooseCategoryState>(
        bloc: chooseCategoryCubit,
        builder: (BuildContext context, state) {
          arrowBackFunction() {
            chooseCategoryCubit.showMainCategories();
          }

          if (state is SubCategoryChosen || state is MainCategoryChosen) Navigator.pop(context);
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state is ShowCategories || state is Loading
                      ? Text(getTranslated(
                          context, StringsConstants.chooseCategory)!)
                      : Text(getTranslated(
                          context, StringsConstants.chooseSection)!),
                  IconButton(
                    icon: Icon(Icons.arrow_upward),
                    onPressed: state is ShowSections ? arrowBackFunction : null,
                  )
                ],
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                child: state is ShowCategories
                    ? mainCategoriesBuilder(
                        mainCategories: state.categories,
                      )
                    : state is ShowSections
                        ? Column(
                            children: [
                              isForFiltering
                                  ? TextButton(
                                      child: Text(getTranslated(context,
                                          StringsConstants.wholeCategory)!),
                                      onPressed: () {
                                        chooseCategoryCubit.chooseMainCategory(currentMainCategory);
                                      },
                                    )
                                  : Container(),
                              subCategoriesBuilder(
                                  subCategories: state.subCategories),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(getTranslated(context, StringsConstants.cancel)!),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        },
      );
    },
  );
}
