import 'package:ecommerce_admin_tut/src/models/main_category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_category_item_state.freezed.dart';

@freezed
abstract class MainCategoryItemState with _$MainCategoryItemState {
  const factory MainCategoryItemState.idle() = Idle;

  const factory MainCategoryItemState.loading() = Loading;

  const factory MainCategoryItemState.uploaded(MainCategoryModel mainCategory) = Uploaded;

  const factory MainCategoryItemState.editing() = Editing;

  const factory MainCategoryItemState.arNameEdited(String arName) = ArNameEdited;

  const factory MainCategoryItemState.enNameEdited(String enName) = EnNameEdited;

  const factory MainCategoryItemState.deleted() = Deleted;

  const factory MainCategoryItemState.error(String e) = Error;

}
