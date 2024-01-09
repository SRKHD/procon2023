// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_kind_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrainingKindState {
  TrainingKind get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrainingKindStateCopyWith<TrainingKindState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingKindStateCopyWith<$Res> {
  factory $TrainingKindStateCopyWith(
          TrainingKindState value, $Res Function(TrainingKindState) then) =
      _$TrainingKindStateCopyWithImpl<$Res, TrainingKindState>;
  @useResult
  $Res call({TrainingKind value});
}

/// @nodoc
class _$TrainingKindStateCopyWithImpl<$Res, $Val extends TrainingKindState>
    implements $TrainingKindStateCopyWith<$Res> {
  _$TrainingKindStateCopyWithImpl(this._value, this._then);

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
              as TrainingKind,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingKindStateImplCopyWith<$Res>
    implements $TrainingKindStateCopyWith<$Res> {
  factory _$$TrainingKindStateImplCopyWith(_$TrainingKindStateImpl value,
          $Res Function(_$TrainingKindStateImpl) then) =
      __$$TrainingKindStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TrainingKind value});
}

/// @nodoc
class __$$TrainingKindStateImplCopyWithImpl<$Res>
    extends _$TrainingKindStateCopyWithImpl<$Res, _$TrainingKindStateImpl>
    implements _$$TrainingKindStateImplCopyWith<$Res> {
  __$$TrainingKindStateImplCopyWithImpl(_$TrainingKindStateImpl _value,
      $Res Function(_$TrainingKindStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$TrainingKindStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as TrainingKind,
    ));
  }
}

/// @nodoc

class _$TrainingKindStateImpl implements _TrainingKindState {
  const _$TrainingKindStateImpl({required this.value});

  @override
  final TrainingKind value;

  @override
  String toString() {
    return 'TrainingKindState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingKindStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingKindStateImplCopyWith<_$TrainingKindStateImpl> get copyWith =>
      __$$TrainingKindStateImplCopyWithImpl<_$TrainingKindStateImpl>(
          this, _$identity);
}

abstract class _TrainingKindState implements TrainingKindState {
  const factory _TrainingKindState({required final TrainingKind value}) =
      _$TrainingKindStateImpl;

  @override
  TrainingKind get value;
  @override
  @JsonKey(ignore: true)
  _$$TrainingKindStateImplCopyWith<_$TrainingKindStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
