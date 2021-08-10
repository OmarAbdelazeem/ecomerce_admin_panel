// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'choose_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChooseCategoryStateTearOff {
  const _$ChooseCategoryStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  ShowCategoriesDialogue showCategoriesDialogue() {
    return const ShowCategoriesDialogue();
  }

  MainCategoryChosen mainCategoryChosen(MainCategoryModel mainCategory) {
    return MainCategoryChosen(
      mainCategory,
    );
  }

  SubCategoryChosen subCategoryChosen(MainCategoryModel chosenMainCategory,
      SubCategoryModel chosenSubCategory) {
    return SubCategoryChosen(
      chosenMainCategory,
      chosenSubCategory,
    );
  }

  ShowCategories showMainCategories(List<MainCategoryModel> categories) {
    return ShowCategories(
      categories,
    );
  }

  ShowSections showSubCategories(List<SubCategoryModel> subCategories) {
    return ShowSections(
      subCategories,
    );
  }
}

/// @nodoc
const $ChooseCategoryState = _$ChooseCategoryStateTearOff();

/// @nodoc
mixin _$ChooseCategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChooseCategoryStateCopyWith<$Res> {
  factory $ChooseCategoryStateCopyWith(
          ChooseCategoryState value, $Res Function(ChooseCategoryState) then) =
      _$ChooseCategoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $ChooseCategoryStateCopyWith<$Res> {
  _$ChooseCategoryStateCopyWithImpl(this._value, this._then);

  final ChooseCategoryState _value;
  // ignore: unused_field
  final $Res Function(ChooseCategoryState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'ChooseCategoryState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements ChooseCategoryState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ChooseCategoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ChooseCategoryState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ShowCategoriesDialogueCopyWith<$Res> {
  factory $ShowCategoriesDialogueCopyWith(ShowCategoriesDialogue value,
          $Res Function(ShowCategoriesDialogue) then) =
      _$ShowCategoriesDialogueCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShowCategoriesDialogueCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $ShowCategoriesDialogueCopyWith<$Res> {
  _$ShowCategoriesDialogueCopyWithImpl(ShowCategoriesDialogue _value,
      $Res Function(ShowCategoriesDialogue) _then)
      : super(_value, (v) => _then(v as ShowCategoriesDialogue));

  @override
  ShowCategoriesDialogue get _value => super._value as ShowCategoriesDialogue;
}

/// @nodoc

class _$ShowCategoriesDialogue implements ShowCategoriesDialogue {
  const _$ShowCategoriesDialogue();

  @override
  String toString() {
    return 'ChooseCategoryState.showCategoriesDialogue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShowCategoriesDialogue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return showCategoriesDialogue();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showCategoriesDialogue != null) {
      return showCategoriesDialogue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return showCategoriesDialogue(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showCategoriesDialogue != null) {
      return showCategoriesDialogue(this);
    }
    return orElse();
  }
}

abstract class ShowCategoriesDialogue implements ChooseCategoryState {
  const factory ShowCategoriesDialogue() = _$ShowCategoriesDialogue;
}

/// @nodoc
abstract class $MainCategoryChosenCopyWith<$Res> {
  factory $MainCategoryChosenCopyWith(
          MainCategoryChosen value, $Res Function(MainCategoryChosen) then) =
      _$MainCategoryChosenCopyWithImpl<$Res>;
  $Res call({MainCategoryModel mainCategory});
}

/// @nodoc
class _$MainCategoryChosenCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $MainCategoryChosenCopyWith<$Res> {
  _$MainCategoryChosenCopyWithImpl(
      MainCategoryChosen _value, $Res Function(MainCategoryChosen) _then)
      : super(_value, (v) => _then(v as MainCategoryChosen));

  @override
  MainCategoryChosen get _value => super._value as MainCategoryChosen;

  @override
  $Res call({
    Object? mainCategory = freezed,
  }) {
    return _then(MainCategoryChosen(
      mainCategory == freezed
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as MainCategoryModel,
    ));
  }
}

/// @nodoc

class _$MainCategoryChosen implements MainCategoryChosen {
  const _$MainCategoryChosen(this.mainCategory);

  @override
  final MainCategoryModel mainCategory;

  @override
  String toString() {
    return 'ChooseCategoryState.mainCategoryChosen(mainCategory: $mainCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MainCategoryChosen &&
            (identical(other.mainCategory, mainCategory) ||
                const DeepCollectionEquality()
                    .equals(other.mainCategory, mainCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(mainCategory);

  @JsonKey(ignore: true)
  @override
  $MainCategoryChosenCopyWith<MainCategoryChosen> get copyWith =>
      _$MainCategoryChosenCopyWithImpl<MainCategoryChosen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return mainCategoryChosen(mainCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (mainCategoryChosen != null) {
      return mainCategoryChosen(mainCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return mainCategoryChosen(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (mainCategoryChosen != null) {
      return mainCategoryChosen(this);
    }
    return orElse();
  }
}

abstract class MainCategoryChosen implements ChooseCategoryState {
  const factory MainCategoryChosen(MainCategoryModel mainCategory) =
      _$MainCategoryChosen;

  MainCategoryModel get mainCategory => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainCategoryChosenCopyWith<MainCategoryChosen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryChosenCopyWith<$Res> {
  factory $SubCategoryChosenCopyWith(
          SubCategoryChosen value, $Res Function(SubCategoryChosen) then) =
      _$SubCategoryChosenCopyWithImpl<$Res>;
  $Res call(
      {MainCategoryModel chosenMainCategory,
      SubCategoryModel chosenSubCategory});
}

/// @nodoc
class _$SubCategoryChosenCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $SubCategoryChosenCopyWith<$Res> {
  _$SubCategoryChosenCopyWithImpl(
      SubCategoryChosen _value, $Res Function(SubCategoryChosen) _then)
      : super(_value, (v) => _then(v as SubCategoryChosen));

  @override
  SubCategoryChosen get _value => super._value as SubCategoryChosen;

  @override
  $Res call({
    Object? chosenMainCategory = freezed,
    Object? chosenSubCategory = freezed,
  }) {
    return _then(SubCategoryChosen(
      chosenMainCategory == freezed
          ? _value.chosenMainCategory
          : chosenMainCategory // ignore: cast_nullable_to_non_nullable
              as MainCategoryModel,
      chosenSubCategory == freezed
          ? _value.chosenSubCategory
          : chosenSubCategory // ignore: cast_nullable_to_non_nullable
              as SubCategoryModel,
    ));
  }
}

/// @nodoc

class _$SubCategoryChosen implements SubCategoryChosen {
  const _$SubCategoryChosen(this.chosenMainCategory, this.chosenSubCategory);

  @override
  final MainCategoryModel chosenMainCategory;
  @override
  final SubCategoryModel chosenSubCategory;

  @override
  String toString() {
    return 'ChooseCategoryState.subCategoryChosen(chosenMainCategory: $chosenMainCategory, chosenSubCategory: $chosenSubCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubCategoryChosen &&
            (identical(other.chosenMainCategory, chosenMainCategory) ||
                const DeepCollectionEquality()
                    .equals(other.chosenMainCategory, chosenMainCategory)) &&
            (identical(other.chosenSubCategory, chosenSubCategory) ||
                const DeepCollectionEquality()
                    .equals(other.chosenSubCategory, chosenSubCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(chosenMainCategory) ^
      const DeepCollectionEquality().hash(chosenSubCategory);

  @JsonKey(ignore: true)
  @override
  $SubCategoryChosenCopyWith<SubCategoryChosen> get copyWith =>
      _$SubCategoryChosenCopyWithImpl<SubCategoryChosen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return subCategoryChosen(chosenMainCategory, chosenSubCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (subCategoryChosen != null) {
      return subCategoryChosen(chosenMainCategory, chosenSubCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return subCategoryChosen(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (subCategoryChosen != null) {
      return subCategoryChosen(this);
    }
    return orElse();
  }
}

abstract class SubCategoryChosen implements ChooseCategoryState {
  const factory SubCategoryChosen(MainCategoryModel chosenMainCategory,
      SubCategoryModel chosenSubCategory) = _$SubCategoryChosen;

  MainCategoryModel get chosenMainCategory =>
      throw _privateConstructorUsedError;
  SubCategoryModel get chosenSubCategory => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryChosenCopyWith<SubCategoryChosen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowCategoriesCopyWith<$Res> {
  factory $ShowCategoriesCopyWith(
          ShowCategories value, $Res Function(ShowCategories) then) =
      _$ShowCategoriesCopyWithImpl<$Res>;
  $Res call({List<MainCategoryModel> categories});
}

/// @nodoc
class _$ShowCategoriesCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $ShowCategoriesCopyWith<$Res> {
  _$ShowCategoriesCopyWithImpl(
      ShowCategories _value, $Res Function(ShowCategories) _then)
      : super(_value, (v) => _then(v as ShowCategories));

  @override
  ShowCategories get _value => super._value as ShowCategories;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(ShowCategories(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MainCategoryModel>,
    ));
  }
}

/// @nodoc

class _$ShowCategories implements ShowCategories {
  const _$ShowCategories(this.categories);

  @override
  final List<MainCategoryModel> categories;

  @override
  String toString() {
    return 'ChooseCategoryState.showMainCategories(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowCategories &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  $ShowCategoriesCopyWith<ShowCategories> get copyWith =>
      _$ShowCategoriesCopyWithImpl<ShowCategories>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return showMainCategories(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showMainCategories != null) {
      return showMainCategories(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return showMainCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showMainCategories != null) {
      return showMainCategories(this);
    }
    return orElse();
  }
}

abstract class ShowCategories implements ChooseCategoryState {
  const factory ShowCategories(List<MainCategoryModel> categories) =
      _$ShowCategories;

  List<MainCategoryModel> get categories => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowCategoriesCopyWith<ShowCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowSectionsCopyWith<$Res> {
  factory $ShowSectionsCopyWith(
          ShowSections value, $Res Function(ShowSections) then) =
      _$ShowSectionsCopyWithImpl<$Res>;
  $Res call({List<SubCategoryModel> subCategories});
}

/// @nodoc
class _$ShowSectionsCopyWithImpl<$Res>
    extends _$ChooseCategoryStateCopyWithImpl<$Res>
    implements $ShowSectionsCopyWith<$Res> {
  _$ShowSectionsCopyWithImpl(
      ShowSections _value, $Res Function(ShowSections) _then)
      : super(_value, (v) => _then(v as ShowSections));

  @override
  ShowSections get _value => super._value as ShowSections;

  @override
  $Res call({
    Object? subCategories = freezed,
  }) {
    return _then(ShowSections(
      subCategories == freezed
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryModel>,
    ));
  }
}

/// @nodoc

class _$ShowSections implements ShowSections {
  const _$ShowSections(this.subCategories);

  @override
  final List<SubCategoryModel> subCategories;

  @override
  String toString() {
    return 'ChooseCategoryState.showSubCategories(subCategories: $subCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShowSections &&
            (identical(other.subCategories, subCategories) ||
                const DeepCollectionEquality()
                    .equals(other.subCategories, subCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subCategories);

  @JsonKey(ignore: true)
  @override
  $ShowSectionsCopyWith<ShowSections> get copyWith =>
      _$ShowSectionsCopyWithImpl<ShowSections>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() showCategoriesDialogue,
    required TResult Function(MainCategoryModel mainCategory)
        mainCategoryChosen,
    required TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)
        subCategoryChosen,
    required TResult Function(List<MainCategoryModel> categories)
        showMainCategories,
    required TResult Function(List<SubCategoryModel> subCategories)
        showSubCategories,
  }) {
    return showSubCategories(subCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? showCategoriesDialogue,
    TResult Function(MainCategoryModel mainCategory)? mainCategoryChosen,
    TResult Function(MainCategoryModel chosenMainCategory,
            SubCategoryModel chosenSubCategory)?
        subCategoryChosen,
    TResult Function(List<MainCategoryModel> categories)? showMainCategories,
    TResult Function(List<SubCategoryModel> subCategories)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showSubCategories != null) {
      return showSubCategories(subCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ShowCategoriesDialogue value)
        showCategoriesDialogue,
    required TResult Function(MainCategoryChosen value) mainCategoryChosen,
    required TResult Function(SubCategoryChosen value) subCategoryChosen,
    required TResult Function(ShowCategories value) showMainCategories,
    required TResult Function(ShowSections value) showSubCategories,
  }) {
    return showSubCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ShowCategoriesDialogue value)? showCategoriesDialogue,
    TResult Function(MainCategoryChosen value)? mainCategoryChosen,
    TResult Function(SubCategoryChosen value)? subCategoryChosen,
    TResult Function(ShowCategories value)? showMainCategories,
    TResult Function(ShowSections value)? showSubCategories,
    required TResult orElse(),
  }) {
    if (showSubCategories != null) {
      return showSubCategories(this);
    }
    return orElse();
  }
}

abstract class ShowSections implements ChooseCategoryState {
  const factory ShowSections(List<SubCategoryModel> subCategories) =
      _$ShowSections;

  List<SubCategoryModel> get subCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowSectionsCopyWith<ShowSections> get copyWith =>
      throw _privateConstructorUsedError;
}
