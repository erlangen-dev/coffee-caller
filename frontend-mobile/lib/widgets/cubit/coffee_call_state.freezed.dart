// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee_call_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoffeeCallState {
  SocketConnectStatus get connectStatus => throw _privateConstructorUsedError;
  CoffeeCall get coffeeCall => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoffeeCallStateCopyWith<CoffeeCallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCallStateCopyWith<$Res> {
  factory $CoffeeCallStateCopyWith(
          CoffeeCallState value, $Res Function(CoffeeCallState) then) =
      _$CoffeeCallStateCopyWithImpl<$Res>;
  $Res call({SocketConnectStatus connectStatus, CoffeeCall coffeeCall});

  $CoffeeCallCopyWith<$Res> get coffeeCall;
}

/// @nodoc
class _$CoffeeCallStateCopyWithImpl<$Res>
    implements $CoffeeCallStateCopyWith<$Res> {
  _$CoffeeCallStateCopyWithImpl(this._value, this._then);

  final CoffeeCallState _value;
  // ignore: unused_field
  final $Res Function(CoffeeCallState) _then;

  @override
  $Res call({
    Object? connectStatus = freezed,
    Object? coffeeCall = freezed,
  }) {
    return _then(_value.copyWith(
      connectStatus: connectStatus == freezed
          ? _value.connectStatus
          : connectStatus // ignore: cast_nullable_to_non_nullable
              as SocketConnectStatus,
      coffeeCall: coffeeCall == freezed
          ? _value.coffeeCall
          : coffeeCall // ignore: cast_nullable_to_non_nullable
              as CoffeeCall,
    ));
  }

  @override
  $CoffeeCallCopyWith<$Res> get coffeeCall {
    return $CoffeeCallCopyWith<$Res>(_value.coffeeCall, (value) {
      return _then(_value.copyWith(coffeeCall: value));
    });
  }
}

/// @nodoc
abstract class _$$_CoffeeCallStateCopyWith<$Res>
    implements $CoffeeCallStateCopyWith<$Res> {
  factory _$$_CoffeeCallStateCopyWith(
          _$_CoffeeCallState value, $Res Function(_$_CoffeeCallState) then) =
      __$$_CoffeeCallStateCopyWithImpl<$Res>;
  @override
  $Res call({SocketConnectStatus connectStatus, CoffeeCall coffeeCall});

  @override
  $CoffeeCallCopyWith<$Res> get coffeeCall;
}

/// @nodoc
class __$$_CoffeeCallStateCopyWithImpl<$Res>
    extends _$CoffeeCallStateCopyWithImpl<$Res>
    implements _$$_CoffeeCallStateCopyWith<$Res> {
  __$$_CoffeeCallStateCopyWithImpl(
      _$_CoffeeCallState _value, $Res Function(_$_CoffeeCallState) _then)
      : super(_value, (v) => _then(v as _$_CoffeeCallState));

  @override
  _$_CoffeeCallState get _value => super._value as _$_CoffeeCallState;

  @override
  $Res call({
    Object? connectStatus = freezed,
    Object? coffeeCall = freezed,
  }) {
    return _then(_$_CoffeeCallState(
      connectStatus == freezed
          ? _value.connectStatus
          : connectStatus // ignore: cast_nullable_to_non_nullable
              as SocketConnectStatus,
      coffeeCall == freezed
          ? _value.coffeeCall
          : coffeeCall // ignore: cast_nullable_to_non_nullable
              as CoffeeCall,
    ));
  }
}

/// @nodoc

class _$_CoffeeCallState implements _CoffeeCallState {
  const _$_CoffeeCallState(
      [this.connectStatus = SocketConnectStatus.unknown,
      this.coffeeCall = const CoffeeCall(CoffeeCallStatus.inactive, [], [])]);

  @override
  @JsonKey()
  final SocketConnectStatus connectStatus;
  @override
  @JsonKey()
  final CoffeeCall coffeeCall;

  @override
  String toString() {
    return 'CoffeeCallState(connectStatus: $connectStatus, coffeeCall: $coffeeCall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeCallState &&
            const DeepCollectionEquality()
                .equals(other.connectStatus, connectStatus) &&
            const DeepCollectionEquality()
                .equals(other.coffeeCall, coffeeCall));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(connectStatus),
      const DeepCollectionEquality().hash(coffeeCall));

  @JsonKey(ignore: true)
  @override
  _$$_CoffeeCallStateCopyWith<_$_CoffeeCallState> get copyWith =>
      __$$_CoffeeCallStateCopyWithImpl<_$_CoffeeCallState>(this, _$identity);
}

abstract class _CoffeeCallState implements CoffeeCallState {
  const factory _CoffeeCallState(
      [final SocketConnectStatus connectStatus,
      final CoffeeCall coffeeCall]) = _$_CoffeeCallState;

  @override
  SocketConnectStatus get connectStatus;
  @override
  CoffeeCall get coffeeCall;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeCallStateCopyWith<_$_CoffeeCallState> get copyWith =>
      throw _privateConstructorUsedError;
}
