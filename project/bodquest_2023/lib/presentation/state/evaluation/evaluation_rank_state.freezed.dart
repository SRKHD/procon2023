// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evaluation_rank_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EvaluationRankState {
  EvaluationRank get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EvaluationRankStateCopyWith<EvaluationRankState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationRankStateCopyWith<$Res> {
  factory $EvaluationRankStateCopyWith(
          EvaluationRankState value, $Res Function(EvaluationRankState) then) =
      _$EvaluationRankStateCopyWithImpl<$Res, EvaluationRankState>;
  @useResult
  $Res call({EvaluationRank value});
}

/// @nodoc
class _$EvaluationRankStateCopyWithImpl<$Res, $Val extends EvaluationRankState>
    implements $EvaluationRankStateCopyWith<$Res> {
  _$EvaluationRankStateCopyWithImpl(this._value, this._then);

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
              as EvaluationRank,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvaluationRankStateImplCopyWith<$Res>
    implements $EvaluationRankStateCopyWith<$Res> {
  factory _$$EvaluationRankStateImplCopyWith(_$EvaluationRankStateImpl value,
          $Res Function(_$EvaluationRankStateImpl) then) =
      __$$EvaluationRankStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EvaluationRank value});
}

/// @nodoc
class __$$EvaluationRankStateImplCopyWithImpl<$Res>
    extends _$EvaluationRankStateCopyWithImpl<$Res, _$EvaluationRankStateImpl>
    implements _$$EvaluationRankStateImplCopyWith<$Res> {
  __$$EvaluationRankStateImplCopyWithImpl(_$EvaluationRankStateImpl _value,
      $Res Function(_$EvaluationRankStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$EvaluationRankStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as EvaluationRank,
    ));
  }
}

/// @nodoc

class _$EvaluationRankStateImpl implements _EvaluationRankState {
  const _$EvaluationRankStateImpl({required this.value});

  @override
  final EvaluationRank value;

  @override
  String toString() {
    return 'EvaluationRankState(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvaluationRankStateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvaluationRankStateImplCopyWith<_$EvaluationRankStateImpl> get copyWith =>
      __$$EvaluationRankStateImplCopyWithImpl<_$EvaluationRankStateImpl>(
          this, _$identity);
}

abstract class _EvaluationRankState implements EvaluationRankState {
  const factory _EvaluationRankState({required final EvaluationRank value}) =
      _$EvaluationRankStateImpl;

  @override
  EvaluationRank get value;
  @override
  @JsonKey(ignore: true)
  _$$EvaluationRankStateImplCopyWith<_$EvaluationRankStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
