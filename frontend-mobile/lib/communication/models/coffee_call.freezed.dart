// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coffee_call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoffeeCall _$CoffeeCallFromJson(Map<String, dynamic> json) {
  return _CoffeeCall.fromJson(json);
}

/// @nodoc
mixin _$CoffeeCall {
  CoffeeCallStatus get status => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;
  List<TimedCoffeeCallerCommand> get messages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoffeeCallCopyWith<CoffeeCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeCallCopyWith<$Res> {
  factory $CoffeeCallCopyWith(
          CoffeeCall value, $Res Function(CoffeeCall) then) =
      _$CoffeeCallCopyWithImpl<$Res>;
  $Res call(
      {CoffeeCallStatus status,
      List<String> participants,
      List<TimedCoffeeCallerCommand> messages});
}

/// @nodoc
class _$CoffeeCallCopyWithImpl<$Res> implements $CoffeeCallCopyWith<$Res> {
  _$CoffeeCallCopyWithImpl(this._value, this._then);

  final CoffeeCall _value;
  // ignore: unused_field
  final $Res Function(CoffeeCall) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? participants = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CoffeeCallStatus,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TimedCoffeeCallerCommand>,
    ));
  }
}

/// @nodoc
abstract class _$$_CoffeeCallCopyWith<$Res>
    implements $CoffeeCallCopyWith<$Res> {
  factory _$$_CoffeeCallCopyWith(
          _$_CoffeeCall value, $Res Function(_$_CoffeeCall) then) =
      __$$_CoffeeCallCopyWithImpl<$Res>;
  @override
  $Res call(
      {CoffeeCallStatus status,
      List<String> participants,
      List<TimedCoffeeCallerCommand> messages});
}

/// @nodoc
class __$$_CoffeeCallCopyWithImpl<$Res> extends _$CoffeeCallCopyWithImpl<$Res>
    implements _$$_CoffeeCallCopyWith<$Res> {
  __$$_CoffeeCallCopyWithImpl(
      _$_CoffeeCall _value, $Res Function(_$_CoffeeCall) _then)
      : super(_value, (v) => _then(v as _$_CoffeeCall));

  @override
  _$_CoffeeCall get _value => super._value as _$_CoffeeCall;

  @override
  $Res call({
    Object? status = freezed,
    Object? participants = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$_CoffeeCall(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CoffeeCallStatus,
      participants == freezed
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      messages == freezed
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TimedCoffeeCallerCommand>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoffeeCall implements _CoffeeCall {
  const _$_CoffeeCall(this.status, final List<String> participants,
      final List<TimedCoffeeCallerCommand> messages)
      : _participants = participants,
        _messages = messages;

  factory _$_CoffeeCall.fromJson(Map<String, dynamic> json) =>
      _$$_CoffeeCallFromJson(json);

  @override
  final CoffeeCallStatus status;
  final List<String> _participants;
  @override
  List<String> get participants {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  final List<TimedCoffeeCallerCommand> _messages;
  @override
  List<TimedCoffeeCallerCommand> get messages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'CoffeeCall(status: $status, participants: $participants, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoffeeCall &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_participants),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  _$$_CoffeeCallCopyWith<_$_CoffeeCall> get copyWith =>
      __$$_CoffeeCallCopyWithImpl<_$_CoffeeCall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoffeeCallToJson(
      this,
    );
  }
}

abstract class _CoffeeCall implements CoffeeCall {
  const factory _CoffeeCall(
      final CoffeeCallStatus status,
      final List<String> participants,
      final List<TimedCoffeeCallerCommand> messages) = _$_CoffeeCall;

  factory _CoffeeCall.fromJson(Map<String, dynamic> json) =
      _$_CoffeeCall.fromJson;

  @override
  CoffeeCallStatus get status;
  @override
  List<String> get participants;
  @override
  List<TimedCoffeeCallerCommand> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_CoffeeCallCopyWith<_$_CoffeeCall> get copyWith =>
      throw _privateConstructorUsedError;
}
