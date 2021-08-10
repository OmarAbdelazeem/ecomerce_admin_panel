// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'customer_analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomerAnalyticsStateTearOff {
  const _$CustomerAnalyticsStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  Loaded loaded(List<CustomerAnalyticsModel> customerAnalyticsProducts) {
    return Loaded(
      customerAnalyticsProducts,
    );
  }
}

/// @nodoc
const $CustomerAnalyticsState = _$CustomerAnalyticsStateTearOff();

/// @nodoc
mixin _$CustomerAnalyticsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<CustomerAnalyticsModel> customerAnalyticsProducts)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(List<CustomerAnalyticsModel> customerAnalyticsProducts)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAnalyticsStateCopyWith<$Res> {
  factory $CustomerAnalyticsStateCopyWith(CustomerAnalyticsState value,
          $Res Function(CustomerAnalyticsState) then) =
      _$CustomerAnalyticsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomerAnalyticsStateCopyWithImpl<$Res>
    implements $CustomerAnalyticsStateCopyWith<$Res> {
  _$CustomerAnalyticsStateCopyWithImpl(this._value, this._then);

  final CustomerAnalyticsState _value;
  // ignore: unused_field
  final $Res Function(CustomerAnalyticsState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res>
    extends _$CustomerAnalyticsStateCopyWithImpl<$Res>
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
    return 'CustomerAnalyticsState.idle()';
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
    required TResult Function(
            List<CustomerAnalyticsModel> customerAnalyticsProducts)
        loaded,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(List<CustomerAnalyticsModel> customerAnalyticsProducts)?
        loaded,
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
    required TResult Function(Loaded value) loaded,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements CustomerAnalyticsState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$CustomerAnalyticsStateCopyWithImpl<$Res>
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
    return 'CustomerAnalyticsState.loading()';
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
    required TResult Function(
            List<CustomerAnalyticsModel> customerAnalyticsProducts)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(List<CustomerAnalyticsModel> customerAnalyticsProducts)?
        loaded,
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
    required TResult Function(Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CustomerAnalyticsState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<CustomerAnalyticsModel> customerAnalyticsProducts});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    extends _$CustomerAnalyticsStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? customerAnalyticsProducts = freezed,
  }) {
    return _then(Loaded(
      customerAnalyticsProducts == freezed
          ? _value.customerAnalyticsProducts
          : customerAnalyticsProducts // ignore: cast_nullable_to_non_nullable
              as List<CustomerAnalyticsModel>,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.customerAnalyticsProducts);

  @override
  final List<CustomerAnalyticsModel> customerAnalyticsProducts;

  @override
  String toString() {
    return 'CustomerAnalyticsState.loaded(customerAnalyticsProducts: $customerAnalyticsProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.customerAnalyticsProducts,
                    customerAnalyticsProducts) ||
                const DeepCollectionEquality().equals(
                    other.customerAnalyticsProducts,
                    customerAnalyticsProducts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customerAnalyticsProducts);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(
            List<CustomerAnalyticsModel> customerAnalyticsProducts)
        loaded,
  }) {
    return loaded(customerAnalyticsProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(List<CustomerAnalyticsModel> customerAnalyticsProducts)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(customerAnalyticsProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements CustomerAnalyticsState {
  const factory Loaded(List<CustomerAnalyticsModel> customerAnalyticsProducts) =
      _$Loaded;

  List<CustomerAnalyticsModel> get customerAnalyticsProducts =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}
