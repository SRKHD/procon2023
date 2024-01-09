// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_kind_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealKindState {
  MealKind get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealKindStateCopyWith<MealKindState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealKindStateCopyWith<$Res> {
  factory $MealKindStateCopyWith(
          MealKindState value, $Res Function(MealKindState) then) =
      _$MealKindStateCopyWithImpl<$Res, MealKindState>;
  @useResult
  $Res call({MealKind value});
}

/// @nodoc
class _$MealKindStateCopyWithImpl<$Res, $Val extends MealKindState>
    implements $MealKindStateCopyWith<$Res> {
  _$MealKindStateCopyWithImpl(this._value, this._then);

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
              as MealKind,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealKindStateImplCopyWith<$Res>
    implements $MealKindStateCopyWith<$Res> {
  factory _$$MealKindStateImplCopyWith(
          _$MealKindStateImpl value, $Res Function(_$MealKindStateImpl) then) =
      __$$MealKindStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MealKind value});
}

/// @nodoc
class __$$MealKindStateImplCopyWithImpl<$Res>
    extends _$MealKindStateCopyWithImpl<$Res, _$MealKindStateImpl>
    implements _$$MealKindStateImplCopyWith<$Res> {
  __$$MealKindStateImplCopyWithImpl(
      _$MealKindStateImpl _value, $Res Function(_$MealKindStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MealKindStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MealKind,
    ));
  }
}

/// @nodoc

class _$MealKindStateImpl implements _MealKindState {
  const _$MealKindStateImpl({required this.value});

  @override
  final MealKind value;

  @override
  String toString() {
    return 'MealKindState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealKindStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealKindStateImplCopyWith<_$MealKindStateImpl> get copyWith =>
      __$$MealKindStateImplCopyWithImpl<_$MealKindStateImpl>(this, _$identity);
}

abstract class _MealKindState implements MealKindState {
  const factory _MealKindState({required final MealKind value}) =
      _$MealKindStateImpl;

  @override
  MealKind get value;
  @override
  @JsonKey(ignore: true)
  _$$MealKindStateImplCopyWith<_$MealKindStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
