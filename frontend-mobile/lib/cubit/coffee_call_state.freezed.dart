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
  CoffeeCallStatus get status => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoffeeCallStateCopyWith<CoffeeCallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCallStateCopyWith<$Res> {
  factory $CoffeeCallStateCopyWith(
          CoffeeCallState value, $Res Function(CoffeeCallState) then) =
      _$CoffeeCallStateCopyWithImpl<$Res>;
  $Res call({CoffeeCallStatus status, List<String> messages});
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
    Object? status = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CoffeeCallStatus,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_CoffeeCallStateCopyWith<$Res>
    implements $CoffeeCallStateCopyWith<$Res> {
  factory _$$_CoffeeCallStateCopyWith(
          _$_CoffeeCallState value, $Res Function(_$_CoffeeCallState) then) =
      __$$_CoffeeCallStateCopyWithImpl<$Res>;
  @override
  $Res call({CoffeeCallStatus status, List<String> messages});
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
    Object? status = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$_CoffeeCallState(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CoffeeCallStatus,
      messages == freezed
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CoffeeCallState implements _CoffeeCallState {
  const _$_CoffeeCallState(
      [this.status = CoffeeCallStatus.initial,
      final List<String> messages = const []])
      : _messages = messages;

  @override
  @JsonKey()
  final CoffeeCallStatus status;
  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'CoffeeCallState(status: $status, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeCallState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  _$$_CoffeeCallStateCopyWith<_$_CoffeeCallState> get copyWith =>
      __$$_CoffeeCallStateCopyWithImpl<_$_CoffeeCallState>(this, _$identity);
}

abstract class _CoffeeCallState implements CoffeeCallState {
  const factory _CoffeeCallState(
      [final CoffeeCallStatus status,
      final List<String> messages]) = _$_CoffeeCallState;

  @override
  CoffeeCallStatus get status;
  @override
  List<String> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeCallStateCopyWith<_$_CoffeeCallState> get copyWith =>
      throw _privateConstructorUsedError;
}
