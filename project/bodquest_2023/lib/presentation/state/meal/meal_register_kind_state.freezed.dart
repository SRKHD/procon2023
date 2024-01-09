// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_register_kind_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealRegisterKindState {
  MealRegisterKind get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealRegisterKindStateCopyWith<MealRegisterKindState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealRegisterKindStateCopyWith<$Res> {
  factory $MealRegisterKindStateCopyWith(MealRegisterKindState value,
          $Res Function(MealRegisterKindState) then) =
      _$MealRegisterKindStateCopyWithImpl<$Res, MealRegisterKindState>;
  @useResult
  $Res call({MealRegisterKind value});
}

/// @nodoc
class _$MealRegisterKindStateCopyWithImpl<$Res,
        $Val extends MealRegisterKindState>
    implements $MealRegisterKindStateCopyWith<$Res> {
  _$MealRegisterKindStateCopyWithImpl(this._value, this._then);

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
              as MealRegisterKind,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealRegisterKindStateImplCopyWith<$Res>
    implements $MealRegisterKindStateCopyWith<$Res> {
  factory _$$MealRegisterKindStateImplCopyWith(
          _$MealRegisterKindStateImpl value,
          $Res Function(_$MealRegisterKindStateImpl) then) =
      __$$MealRegisterKindStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MealRegisterKind value});
}

/// @nodoc
class __$$MealRegisterKindStateImplCopyWithImpl<$Res>
    extends _$MealRegisterKindStateCopyWithImpl<$Res,
        _$MealRegisterKindStateImpl>
    implements _$$MealRegisterKindStateImplCopyWith<$Res> {
  __$$MealRegisterKindStateImplCopyWithImpl(_$MealRegisterKindStateImpl _value,
      $Res Function(_$MealRegisterKindStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$MealRegisterKindStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MealRegisterKind,
    ));
  }
}

/// @nodoc

class _$MealRegisterKindStateImpl implements _MealRegisterKindState {
  const _$MealRegisterKindStateImpl({required this.value});

  @override
  final MealRegisterKind value;

  @override
  String toString() {
    return 'MealRegisterKindState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealRegisterKindStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealRegisterKindStateImplCopyWith<_$MealRegisterKindStateImpl>
      get copyWith => __$$MealRegisterKindStateImplCopyWithImpl<
          _$MealRegisterKindStateImpl>(this, _$identity);
}

abstract class _MealRegisterKindState implements MealRegisterKindState {
  const factory _MealRegisterKindState(
      {required final MealRegisterKind value}) = _$MealRegisterKindStateImpl;

  @override
  MealRegisterKind get value;
  @override
  @JsonKey(ignore: true)
  _$$MealRegisterKindStateImplCopyWith<_$MealRegisterKindStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
