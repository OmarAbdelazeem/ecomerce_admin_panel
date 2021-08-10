// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductItemStateTearOff {
  const _$ProductItemStateTearOff();

  Idle idle() {
    return const Idle();
  }

  ProductDeleted productDeleted() {
    return const ProductDeleted();
  }

  CategoryDeleted categoryDeleted() {
    return const CategoryDeleted();
  }

  FieldUpdated fieldUpdated(dynamic value) {
    return FieldUpdated(
      value,
    );
  }

  CategoryUpdated categoryUpdated(
      {required NameField mainCategory, required NameField subCategory}) {
    return CategoryUpdated(
      mainCategory: mainCategory,
      subCategory: subCategory,
    );
  }

  ImageUpdated imageUpdated(String image) {
    return ImageUpdated(
      image,
    );
  }

  FieldError fieldError(String error) {
    return FieldError(
      error,
    );
  }

  Submitted submitted(ProductModel product) {
    return Submitted(
      product,
    );
  }

  ImagePicked imagePicked(File imageFile) {
    return ImagePicked(
      imageFile,
    );
  }

  ImageClosed imageClosed() {
    return const ImageClosed();
  }

  Loading loading() {
    return const Loading();
  }

  Deleting deleting() {
    return const Deleting();
  }

  Error error(String error) {
    return Error(
      error,
    );
  }
}

/// @nodoc
const $ProductItemState = _$ProductItemStateTearOff();

/// @nodoc
mixin _$ProductItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemStateCopyWith<$Res> {
  factory $ProductItemStateCopyWith(
          ProductItemState value, $Res Function(ProductItemState) then) =
      _$ProductItemStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductItemStateCopyWithImpl<$Res>
    implements $ProductItemStateCopyWith<$Res> {
  _$ProductItemStateCopyWithImpl(this._value, this._then);

  final ProductItemState _value;
  // ignore: unused_field
  final $Res Function(ProductItemState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$ProductItemStateCopyWithImpl<$Res>
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
    return 'ProductItemState.idle()';
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
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
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
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements ProductItemState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $ProductDeletedCopyWith<$Res> {
  factory $ProductDeletedCopyWith(
          ProductDeleted value, $Res Function(ProductDeleted) then) =
      _$ProductDeletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductDeletedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $ProductDeletedCopyWith<$Res> {
  _$ProductDeletedCopyWithImpl(
      ProductDeleted _value, $Res Function(ProductDeleted) _then)
      : super(_value, (v) => _then(v as ProductDeleted));

  @override
  ProductDeleted get _value => super._value as ProductDeleted;
}

/// @nodoc

class _$ProductDeleted implements ProductDeleted {
  const _$ProductDeleted();

  @override
  String toString() {
    return 'ProductItemState.productDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProductDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return productDeleted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (productDeleted != null) {
      return productDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return productDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (productDeleted != null) {
      return productDeleted(this);
    }
    return orElse();
  }
}

abstract class ProductDeleted implements ProductItemState {
  const factory ProductDeleted() = _$ProductDeleted;
}

/// @nodoc
abstract class $CategoryDeletedCopyWith<$Res> {
  factory $CategoryDeletedCopyWith(
          CategoryDeleted value, $Res Function(CategoryDeleted) then) =
      _$CategoryDeletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryDeletedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $CategoryDeletedCopyWith<$Res> {
  _$CategoryDeletedCopyWithImpl(
      CategoryDeleted _value, $Res Function(CategoryDeleted) _then)
      : super(_value, (v) => _then(v as CategoryDeleted));

  @override
  CategoryDeleted get _value => super._value as CategoryDeleted;
}

/// @nodoc

class _$CategoryDeleted implements CategoryDeleted {
  const _$CategoryDeleted();

  @override
  String toString() {
    return 'ProductItemState.categoryDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return categoryDeleted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (categoryDeleted != null) {
      return categoryDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return categoryDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (categoryDeleted != null) {
      return categoryDeleted(this);
    }
    return orElse();
  }
}

abstract class CategoryDeleted implements ProductItemState {
  const factory CategoryDeleted() = _$CategoryDeleted;
}

/// @nodoc
abstract class $FieldUpdatedCopyWith<$Res> {
  factory $FieldUpdatedCopyWith(
          FieldUpdated value, $Res Function(FieldUpdated) then) =
      _$FieldUpdatedCopyWithImpl<$Res>;
  $Res call({dynamic value});
}

/// @nodoc
class _$FieldUpdatedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $FieldUpdatedCopyWith<$Res> {
  _$FieldUpdatedCopyWithImpl(
      FieldUpdated _value, $Res Function(FieldUpdated) _then)
      : super(_value, (v) => _then(v as FieldUpdated));

  @override
  FieldUpdated get _value => super._value as FieldUpdated;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(FieldUpdated(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$FieldUpdated implements FieldUpdated {
  const _$FieldUpdated(this.value);

  @override
  final dynamic value;

  @override
  String toString() {
    return 'ProductItemState.fieldUpdated(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FieldUpdated &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $FieldUpdatedCopyWith<FieldUpdated> get copyWith =>
      _$FieldUpdatedCopyWithImpl<FieldUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return fieldUpdated(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (fieldUpdated != null) {
      return fieldUpdated(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return fieldUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (fieldUpdated != null) {
      return fieldUpdated(this);
    }
    return orElse();
  }
}

abstract class FieldUpdated implements ProductItemState {
  const factory FieldUpdated(dynamic value) = _$FieldUpdated;

  dynamic get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldUpdatedCopyWith<FieldUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryUpdatedCopyWith<$Res> {
  factory $CategoryUpdatedCopyWith(
          CategoryUpdated value, $Res Function(CategoryUpdated) then) =
      _$CategoryUpdatedCopyWithImpl<$Res>;
  $Res call({NameField mainCategory, NameField subCategory});
}

/// @nodoc
class _$CategoryUpdatedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $CategoryUpdatedCopyWith<$Res> {
  _$CategoryUpdatedCopyWithImpl(
      CategoryUpdated _value, $Res Function(CategoryUpdated) _then)
      : super(_value, (v) => _then(v as CategoryUpdated));

  @override
  CategoryUpdated get _value => super._value as CategoryUpdated;

  @override
  $Res call({
    Object? mainCategory = freezed,
    Object? subCategory = freezed,
  }) {
    return _then(CategoryUpdated(
      mainCategory: mainCategory == freezed
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as NameField,
      subCategory: subCategory == freezed
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as NameField,
    ));
  }
}

/// @nodoc

class _$CategoryUpdated implements CategoryUpdated {
  const _$CategoryUpdated(
      {required this.mainCategory, required this.subCategory});

  @override
  final NameField mainCategory;
  @override
  final NameField subCategory;

  @override
  String toString() {
    return 'ProductItemState.categoryUpdated(mainCategory: $mainCategory, subCategory: $subCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryUpdated &&
            (identical(other.mainCategory, mainCategory) ||
                const DeepCollectionEquality()
                    .equals(other.mainCategory, mainCategory)) &&
            (identical(other.subCategory, subCategory) ||
                const DeepCollectionEquality()
                    .equals(other.subCategory, subCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mainCategory) ^
      const DeepCollectionEquality().hash(subCategory);

  @JsonKey(ignore: true)
  @override
  $CategoryUpdatedCopyWith<CategoryUpdated> get copyWith =>
      _$CategoryUpdatedCopyWithImpl<CategoryUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return categoryUpdated(mainCategory, subCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (categoryUpdated != null) {
      return categoryUpdated(mainCategory, subCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return categoryUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (categoryUpdated != null) {
      return categoryUpdated(this);
    }
    return orElse();
  }
}

abstract class CategoryUpdated implements ProductItemState {
  const factory CategoryUpdated(
      {required NameField mainCategory,
      required NameField subCategory}) = _$CategoryUpdated;

  NameField get mainCategory => throw _privateConstructorUsedError;
  NameField get subCategory => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryUpdatedCopyWith<CategoryUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUpdatedCopyWith<$Res> {
  factory $ImageUpdatedCopyWith(
          ImageUpdated value, $Res Function(ImageUpdated) then) =
      _$ImageUpdatedCopyWithImpl<$Res>;
  $Res call({String image});
}

/// @nodoc
class _$ImageUpdatedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $ImageUpdatedCopyWith<$Res> {
  _$ImageUpdatedCopyWithImpl(
      ImageUpdated _value, $Res Function(ImageUpdated) _then)
      : super(_value, (v) => _then(v as ImageUpdated));

  @override
  ImageUpdated get _value => super._value as ImageUpdated;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(ImageUpdated(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageUpdated implements ImageUpdated {
  const _$ImageUpdated(this.image);

  @override
  final String image;

  @override
  String toString() {
    return 'ProductItemState.imageUpdated(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImageUpdated &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  $ImageUpdatedCopyWith<ImageUpdated> get copyWith =>
      _$ImageUpdatedCopyWithImpl<ImageUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return imageUpdated(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (imageUpdated != null) {
      return imageUpdated(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return imageUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (imageUpdated != null) {
      return imageUpdated(this);
    }
    return orElse();
  }
}

abstract class ImageUpdated implements ProductItemState {
  const factory ImageUpdated(String image) = _$ImageUpdated;

  String get image => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageUpdatedCopyWith<ImageUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldErrorCopyWith<$Res> {
  factory $FieldErrorCopyWith(
          FieldError value, $Res Function(FieldError) then) =
      _$FieldErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$FieldErrorCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $FieldErrorCopyWith<$Res> {
  _$FieldErrorCopyWithImpl(FieldError _value, $Res Function(FieldError) _then)
      : super(_value, (v) => _then(v as FieldError));

  @override
  FieldError get _value => super._value as FieldError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(FieldError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FieldError implements FieldError {
  const _$FieldError(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProductItemState.fieldError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FieldError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $FieldErrorCopyWith<FieldError> get copyWith =>
      _$FieldErrorCopyWithImpl<FieldError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return fieldError(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (fieldError != null) {
      return fieldError(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return fieldError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (fieldError != null) {
      return fieldError(this);
    }
    return orElse();
  }
}

abstract class FieldError implements ProductItemState {
  const factory FieldError(String error) = _$FieldError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldErrorCopyWith<FieldError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmittedCopyWith<$Res> {
  factory $SubmittedCopyWith(Submitted value, $Res Function(Submitted) then) =
      _$SubmittedCopyWithImpl<$Res>;
  $Res call({ProductModel product});
}

/// @nodoc
class _$SubmittedCopyWithImpl<$Res> extends _$ProductItemStateCopyWithImpl<$Res>
    implements $SubmittedCopyWith<$Res> {
  _$SubmittedCopyWithImpl(Submitted _value, $Res Function(Submitted) _then)
      : super(_value, (v) => _then(v as Submitted));

  @override
  Submitted get _value => super._value as Submitted;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(Submitted(
      product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class _$Submitted implements Submitted {
  const _$Submitted(this.product);

  @override
  final ProductModel product;

  @override
  String toString() {
    return 'ProductItemState.submitted(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Submitted &&
            (identical(other.product, product) ||
                const DeepCollectionEquality().equals(other.product, product)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(product);

  @JsonKey(ignore: true)
  @override
  $SubmittedCopyWith<Submitted> get copyWith =>
      _$SubmittedCopyWithImpl<Submitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return submitted(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class Submitted implements ProductItemState {
  const factory Submitted(ProductModel product) = _$Submitted;

  ProductModel get product => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmittedCopyWith<Submitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePickedCopyWith<$Res> {
  factory $ImagePickedCopyWith(
          ImagePicked value, $Res Function(ImagePicked) then) =
      _$ImagePickedCopyWithImpl<$Res>;
  $Res call({File imageFile});
}

/// @nodoc
class _$ImagePickedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $ImagePickedCopyWith<$Res> {
  _$ImagePickedCopyWithImpl(
      ImagePicked _value, $Res Function(ImagePicked) _then)
      : super(_value, (v) => _then(v as ImagePicked));

  @override
  ImagePicked get _value => super._value as ImagePicked;

  @override
  $Res call({
    Object? imageFile = freezed,
  }) {
    return _then(ImagePicked(
      imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ImagePicked implements ImagePicked {
  const _$ImagePicked(this.imageFile);

  @override
  final File imageFile;

  @override
  String toString() {
    return 'ProductItemState.imagePicked(imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImagePicked &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  $ImagePickedCopyWith<ImagePicked> get copyWith =>
      _$ImagePickedCopyWithImpl<ImagePicked>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return imagePicked(imageFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(imageFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return imagePicked(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(this);
    }
    return orElse();
  }
}

abstract class ImagePicked implements ProductItemState {
  const factory ImagePicked(File imageFile) = _$ImagePicked;

  File get imageFile => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePickedCopyWith<ImagePicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageClosedCopyWith<$Res> {
  factory $ImageClosedCopyWith(
          ImageClosed value, $Res Function(ImageClosed) then) =
      _$ImageClosedCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImageClosedCopyWithImpl<$Res>
    extends _$ProductItemStateCopyWithImpl<$Res>
    implements $ImageClosedCopyWith<$Res> {
  _$ImageClosedCopyWithImpl(
      ImageClosed _value, $Res Function(ImageClosed) _then)
      : super(_value, (v) => _then(v as ImageClosed));

  @override
  ImageClosed get _value => super._value as ImageClosed;
}

/// @nodoc

class _$ImageClosed implements ImageClosed {
  const _$ImageClosed();

  @override
  String toString() {
    return 'ProductItemState.imageClosed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ImageClosed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return imageClosed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (imageClosed != null) {
      return imageClosed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return imageClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (imageClosed != null) {
      return imageClosed(this);
    }
    return orElse();
  }
}

abstract class ImageClosed implements ProductItemState {
  const factory ImageClosed() = _$ImageClosed;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$ProductItemStateCopyWithImpl<$Res>
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
    return 'ProductItemState.loading()';
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
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
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
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProductItemState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $DeletingCopyWith<$Res> {
  factory $DeletingCopyWith(Deleting value, $Res Function(Deleting) then) =
      _$DeletingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeletingCopyWithImpl<$Res> extends _$ProductItemStateCopyWithImpl<$Res>
    implements $DeletingCopyWith<$Res> {
  _$DeletingCopyWithImpl(Deleting _value, $Res Function(Deleting) _then)
      : super(_value, (v) => _then(v as Deleting));

  @override
  Deleting get _value => super._value as Deleting;
}

/// @nodoc

class _$Deleting implements Deleting {
  const _$Deleting();

  @override
  String toString() {
    return 'ProductItemState.deleting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Deleting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return deleting();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return deleting(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting(this);
    }
    return orElse();
  }
}

abstract class Deleting implements ProductItemState {
  const factory Deleting() = _$Deleting;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$ProductItemStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProductItemState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() productDeleted,
    required TResult Function() categoryDeleted,
    required TResult Function(dynamic value) fieldUpdated,
    required TResult Function(NameField mainCategory, NameField subCategory)
        categoryUpdated,
    required TResult Function(String image) imageUpdated,
    required TResult Function(String error) fieldError,
    required TResult Function(ProductModel product) submitted,
    required TResult Function(File imageFile) imagePicked,
    required TResult Function() imageClosed,
    required TResult Function() loading,
    required TResult Function() deleting,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? productDeleted,
    TResult Function()? categoryDeleted,
    TResult Function(dynamic value)? fieldUpdated,
    TResult Function(NameField mainCategory, NameField subCategory)?
        categoryUpdated,
    TResult Function(String image)? imageUpdated,
    TResult Function(String error)? fieldError,
    TResult Function(ProductModel product)? submitted,
    TResult Function(File imageFile)? imagePicked,
    TResult Function()? imageClosed,
    TResult Function()? loading,
    TResult Function()? deleting,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(ProductDeleted value) productDeleted,
    required TResult Function(CategoryDeleted value) categoryDeleted,
    required TResult Function(FieldUpdated value) fieldUpdated,
    required TResult Function(CategoryUpdated value) categoryUpdated,
    required TResult Function(ImageUpdated value) imageUpdated,
    required TResult Function(FieldError value) fieldError,
    required TResult Function(Submitted value) submitted,
    required TResult Function(ImagePicked value) imagePicked,
    required TResult Function(ImageClosed value) imageClosed,
    required TResult Function(Loading value) loading,
    required TResult Function(Deleting value) deleting,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(ProductDeleted value)? productDeleted,
    TResult Function(CategoryDeleted value)? categoryDeleted,
    TResult Function(FieldUpdated value)? fieldUpdated,
    TResult Function(CategoryUpdated value)? categoryUpdated,
    TResult Function(ImageUpdated value)? imageUpdated,
    TResult Function(FieldError value)? fieldError,
    TResult Function(Submitted value)? submitted,
    TResult Function(ImagePicked value)? imagePicked,
    TResult Function(ImageClosed value)? imageClosed,
    TResult Function(Loading value)? loading,
    TResult Function(Deleting value)? deleting,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProductItemState {
  const factory Error(String error) = _$Error;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
