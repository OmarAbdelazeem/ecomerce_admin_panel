import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_categories_state.freezed.dart';

@freezed
abstract class MainCategoriesState with _$MainCategoriesState {
  const factory MainCategoriesState.idle() = Idle;

  const factory MainCategoriesState.loading() = Loading;

  const factory MainCategoriesState.loaded(List<MainCategoryModel> categories) = Loaded;

  const factory MainCategoriesState.error(dynamic error) = Error;
}
