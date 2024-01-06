// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datetime_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DateTimeState {
  DateTime get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateTimeStateCopyWith<DateTimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateTimeStateCopyWith<$Res> {
  factory $DateTimeStateCopyWith(
          DateTimeState value, $Res Function(DateTimeState) then) =
      _$DateTimeStateCopyWithImpl<$Res, DateTimeState>;
  @useResult
  $Res call({DateTime value});
}

/// @nodoc
class _$DateTimeStateCopyWithImpl<$Res, $Val extends DateTimeState>
    implements $DateTimeStateCopyWith<$Res> {
  _$DateTimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateTimeStateImplCopyWith<$Res>
    implements $DateTimeStateCopyWith<$Res> {
  factory _$$DateTimeStateImplCopyWith(
          _$DateTimeStateImpl value, $Res Function(_$DateTimeStateImpl) then) =
      __$$DateTimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime value});
}

/// @nodoc
class __$$DateTimeStateImplCopyWithImpl<$Res>
    extends _$DateTimeStateCopyWithImpl<$Res, _$DateTimeStateImpl>
    implements _$$DateTimeStateImplCopyWith<$Res> {
  __$$DateTimeStateImplCopyWithImpl(
      _$DateTimeStateImpl _value, $Res Function(_$DateTimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DateTimeStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateTimeStateImpl implements _DateTimeState {
  const _$DateTimeStateImpl({required this.value});

  @override
  final DateTime value;

  @override
  String toString() {
    return 'DateTimeState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateTimeStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateTimeStateImplCopyWith<_$DateTimeStateImpl> get copyWith =>
      __$$DateTimeStateImplCopyWithImpl<_$DateTimeStateImpl>(this, _$identity);
}

abstract class _DateTimeState implements DateTimeState {
  const factory _DateTimeState({required final DateTime value}) =
      _$DateTimeStateImpl;

  @override
  DateTime get value;
  @override
  @JsonKey(ignore: true)
  _$$DateTimeStateImplCopyWith<_$DateTimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
