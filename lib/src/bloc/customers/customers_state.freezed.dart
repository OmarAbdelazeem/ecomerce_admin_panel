// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'customers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomersStateTearOff {
  const _$CustomersStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Loading loading() {
    return const Loading();
  }

  CustomerLoaded customerLoaded(CustomerModel customer) {
    return CustomerLoaded(
      customer,
    );
  }

  CustomersLoaded customersLoaded(List<CustomerModel> customers) {
    return CustomersLoaded(
      customers,
    );
  }

  Error error(String error) {
    return Error(
      error,
    );
  }
}

/// @nodoc
const $CustomersState = _$CustomersStateTearOff();

/// @nodoc
mixin _$CustomersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomersStateCopyWith<$Res> {
  factory $CustomersStateCopyWith(
          CustomersState value, $Res Function(CustomersState) then) =
      _$CustomersStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomersStateCopyWithImpl<$Res>
    implements $CustomersStateCopyWith<$Res> {
  _$CustomersStateCopyWithImpl(this._value, this._then);

  final CustomersState _value;
  // ignore: unused_field
  final $Res Function(CustomersState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$CustomersStateCopyWithImpl<$Res>
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
    return 'CustomersState.idle()';
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
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
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
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements CustomersState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$CustomersStateCopyWithImpl<$Res>
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
    return 'CustomersState.loading()';
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
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
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
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CustomersState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $CustomerLoadedCopyWith<$Res> {
  factory $CustomerLoadedCopyWith(
          CustomerLoaded value, $Res Function(CustomerLoaded) then) =
      _$CustomerLoadedCopyWithImpl<$Res>;
  $Res call({CustomerModel customer});
}

/// @nodoc
class _$CustomerLoadedCopyWithImpl<$Res>
    extends _$CustomersStateCopyWithImpl<$Res>
    implements $CustomerLoadedCopyWith<$Res> {
  _$CustomerLoadedCopyWithImpl(
      CustomerLoaded _value, $Res Function(CustomerLoaded) _then)
      : super(_value, (v) => _then(v as CustomerLoaded));

  @override
  CustomerLoaded get _value => super._value as CustomerLoaded;

  @override
  $Res call({
    Object? customer = freezed,
  }) {
    return _then(CustomerLoaded(
      customer == freezed
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerModel,
    ));
  }
}

/// @nodoc

class _$CustomerLoaded implements CustomerLoaded {
  const _$CustomerLoaded(this.customer);

  @override
  final CustomerModel customer;

  @override
  String toString() {
    return 'CustomersState.customerLoaded(customer: $customer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomerLoaded &&
            (identical(other.customer, customer) ||
                const DeepCollectionEquality()
                    .equals(other.customer, customer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(customer);

  @JsonKey(ignore: true)
  @override
  $CustomerLoadedCopyWith<CustomerLoaded> get copyWith =>
      _$CustomerLoadedCopyWithImpl<CustomerLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) {
    return customerLoaded(customer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (customerLoaded != null) {
      return customerLoaded(customer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) {
    return customerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (customerLoaded != null) {
      return customerLoaded(this);
    }
    return orElse();
  }
}

abstract class CustomerLoaded implements CustomersState {
  const factory CustomerLoaded(CustomerModel customer) = _$CustomerLoaded;

  CustomerModel get customer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerLoadedCopyWith<CustomerLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomersLoadedCopyWith<$Res> {
  factory $CustomersLoadedCopyWith(
          CustomersLoaded value, $Res Function(CustomersLoaded) then) =
      _$CustomersLoadedCopyWithImpl<$Res>;
  $Res call({List<CustomerModel> customers});
}

/// @nodoc
class _$CustomersLoadedCopyWithImpl<$Res>
    extends _$CustomersStateCopyWithImpl<$Res>
    implements $CustomersLoadedCopyWith<$Res> {
  _$CustomersLoadedCopyWithImpl(
      CustomersLoaded _value, $Res Function(CustomersLoaded) _then)
      : super(_value, (v) => _then(v as CustomersLoaded));

  @override
  CustomersLoaded get _value => super._value as CustomersLoaded;

  @override
  $Res call({
    Object? customers = freezed,
  }) {
    return _then(CustomersLoaded(
      customers == freezed
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>,
    ));
  }
}

/// @nodoc

class _$CustomersLoaded implements CustomersLoaded {
  const _$CustomersLoaded(this.customers);

  @override
  final List<CustomerModel> customers;

  @override
  String toString() {
    return 'CustomersState.customersLoaded(customers: $customers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CustomersLoaded &&
            (identical(other.customers, customers) ||
                const DeepCollectionEquality()
                    .equals(other.customers, customers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(customers);

  @JsonKey(ignore: true)
  @override
  $CustomersLoadedCopyWith<CustomersLoaded> get copyWith =>
      _$CustomersLoadedCopyWithImpl<CustomersLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) {
    return customersLoaded(customers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (customersLoaded != null) {
      return customersLoaded(customers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) {
    return customersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (customersLoaded != null) {
      return customersLoaded(this);
    }
    return orElse();
  }
}

abstract class CustomersLoaded implements CustomersState {
  const factory CustomersLoaded(List<CustomerModel> customers) =
      _$CustomersLoaded;

  List<CustomerModel> get customers => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomersLoadedCopyWith<CustomersLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$CustomersStateCopyWithImpl<$Res>
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
    return 'CustomersState.error(error: $error)';
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
    required TResult Function() loading,
    required TResult Function(CustomerModel customer) customerLoaded,
    required TResult Function(List<CustomerModel> customers) customersLoaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(CustomerModel customer)? customerLoaded,
    TResult Function(List<CustomerModel> customers)? customersLoaded,
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
    required TResult Function(Loading value) loading,
    required TResult Function(CustomerLoaded value) customerLoaded,
    required TResult Function(CustomersLoaded value) customersLoaded,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(CustomerLoaded value)? customerLoaded,
    TResult Function(CustomersLoaded value)? customersLoaded,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CustomersState {
  const factory Error(String error) = _$Error;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
