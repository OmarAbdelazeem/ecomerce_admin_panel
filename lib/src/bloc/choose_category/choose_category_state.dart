import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'choose_category_state.freezed.dart';

@freezed
abstract class ChooseCategoryState with _$ChooseCategoryState {
  const factory ChooseCategoryState.idle() = Idle;

  const factory ChooseCategoryState.loading() = Loading;

  const factory ChooseCategoryState.showCategoriesDialogue() =
      ShowCategoriesDialogue;

  const factory ChooseCategoryState.mainCategoryChosen(
      MainCategoryModel mainCategory) = MainCategoryChosen;

  const factory ChooseCategoryState.subCategoryChosen(
      MainCategoryModel chosenMainCategory,
      SubCategoryModel chosenSubCategory) = SubCategoryChosen;

  // const factory ChooseCategoryState.categoriesChosen(
  //     MainCategoryModel chosenMainCategory,
  //     SubCategoryModel chosenSubCategory) = CategoriesChosen;

  const factory ChooseCategoryState.showMainCategories(
      List<MainCategoryModel> categories) = ShowCategories;

  const factory ChooseCategoryState.showSubCategories(
      List<SubCategoryModel> subCategories) = ShowSections;
}
