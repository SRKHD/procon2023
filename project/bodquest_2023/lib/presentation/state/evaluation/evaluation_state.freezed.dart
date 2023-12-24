// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evaluation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EvaluationState {
  String get rank => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EvaluationStateCopyWith<EvaluationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationStateCopyWith<$Res> {
  factory $EvaluationStateCopyWith(
          EvaluationState value, $Res Function(EvaluationState) then) =
      _$EvaluationStateCopyWithImpl<$Res, EvaluationState>;
  @useResult
  $Res call({String rank, int score});
}

/// @nodoc
class _$EvaluationStateCopyWithImpl<$Res, $Val extends EvaluationState>
    implements $EvaluationStateCopyWith<$Res> {
  _$EvaluationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvaluationStateImplCopyWith<$Res>
    implements $EvaluationStateCopyWith<$Res> {
  factory _$$EvaluationStateImplCopyWith(_$EvaluationStateImpl value,
          $Res Function(_$EvaluationStateImpl) then) =
      __$$EvaluationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rank, int score});
}

/// @nodoc
class __$$EvaluationStateImplCopyWithImpl<$Res>
    extends _$EvaluationStateCopyWithImpl<$Res, _$EvaluationStateImpl>
    implements _$$EvaluationStateImplCopyWith<$Res> {
  __$$EvaluationStateImplCopyWithImpl(
      _$EvaluationStateImpl _value, $Res Function(_$EvaluationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? score = null,
  }) {
    return _then(_$EvaluationStateImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EvaluationStateImpl implements _EvaluationState {
  _$EvaluationStateImpl({required this.rank, required this.score});

  @override
  final String rank;
  @override
  final int score;

  @override
  String toString() {
    return 'EvaluationState(rank: $rank, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvaluationStateImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rank, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvaluationStateImplCopyWith<_$EvaluationStateImpl> get copyWith =>
      __$$EvaluationStateImplCopyWithImpl<_$EvaluationStateImpl>(
          this, _$identity);
}

abstract class _EvaluationState implements EvaluationState {
  factory _EvaluationState(
      {required final String rank,
      required final int score}) = _$EvaluationStateImpl;

  @override
  String get rank;
  @override
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$EvaluationStateImplCopyWith<_$EvaluationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
