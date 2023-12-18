// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeightState {
  String get userId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeightStateCopyWith<WeightState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightStateCopyWith<$Res> {
  factory $WeightStateCopyWith(
          WeightState value, $Res Function(WeightState) then) =
      _$WeightStateCopyWithImpl<$Res, WeightState>;
  @useResult
  $Res call({String userId, String date, int timestamp, double value});
}

/// @nodoc
class _$WeightStateCopyWithImpl<$Res, $Val extends WeightState>
    implements $WeightStateCopyWith<$Res> {
  _$WeightStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? date = null,
    Object? timestamp = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightStateImplCopyWith<$Res>
    implements $WeightStateCopyWith<$Res> {
  factory _$$WeightStateImplCopyWith(
          _$WeightStateImpl value, $Res Function(_$WeightStateImpl) then) =
      __$$WeightStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String date, int timestamp, double value});
}

/// @nodoc
class __$$WeightStateImplCopyWithImpl<$Res>
    extends _$WeightStateCopyWithImpl<$Res, _$WeightStateImpl>
    implements _$$WeightStateImplCopyWith<$Res> {
  __$$WeightStateImplCopyWithImpl(
      _$WeightStateImpl _value, $Res Function(_$WeightStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? date = null,
    Object? timestamp = null,
    Object? value = null,
  }) {
    return _then(_$WeightStateImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$WeightStateImpl implements _WeightState {
  _$WeightStateImpl(
      {required this.userId,
      required this.date,
      required this.timestamp,
      required this.value});

  @override
  final String userId;
  @override
  final String date;
  @override
  final int timestamp;
  @override
  final double value;

  @override
  String toString() {
    return 'WeightState(userId: $userId, date: $date, timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightStateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, date, timestamp, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightStateImplCopyWith<_$WeightStateImpl> get copyWith =>
      __$$WeightStateImplCopyWithImpl<_$WeightStateImpl>(this, _$identity);
}

abstract class _WeightState implements WeightState {
  factory _WeightState(
      {required final String userId,
      required final String date,
      required final int timestamp,
      required final double value}) = _$WeightStateImpl;

  @override
  String get userId;
  @override
  String get date;
  @override
  int get timestamp;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$WeightStateImplCopyWith<_$WeightStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
