// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loginuser_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogInUserState {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  double get userHeight => throw _privateConstructorUsedError;
  String get userGender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInUserStateCopyWith<LogInUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInUserStateCopyWith<$Res> {
  factory $LogInUserStateCopyWith(
          LogInUserState value, $Res Function(LogInUserState) then) =
      _$LogInUserStateCopyWithImpl<$Res, LogInUserState>;
  @useResult
  $Res call(
      {String userId, String userName, double userHeight, String userGender});
}

/// @nodoc
class _$LogInUserStateCopyWithImpl<$Res, $Val extends LogInUserState>
    implements $LogInUserStateCopyWith<$Res> {
  _$LogInUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userHeight = null,
    Object? userGender = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userHeight: null == userHeight
          ? _value.userHeight
          : userHeight // ignore: cast_nullable_to_non_nullable
              as double,
      userGender: null == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogInUserStateImplCopyWith<$Res>
    implements $LogInUserStateCopyWith<$Res> {
  factory _$$LogInUserStateImplCopyWith(_$LogInUserStateImpl value,
          $Res Function(_$LogInUserStateImpl) then) =
      __$$LogInUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId, String userName, double userHeight, String userGender});
}

/// @nodoc
class __$$LogInUserStateImplCopyWithImpl<$Res>
    extends _$LogInUserStateCopyWithImpl<$Res, _$LogInUserStateImpl>
    implements _$$LogInUserStateImplCopyWith<$Res> {
  __$$LogInUserStateImplCopyWithImpl(
      _$LogInUserStateImpl _value, $Res Function(_$LogInUserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userHeight = null,
    Object? userGender = null,
  }) {
    return _then(_$LogInUserStateImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userHeight: null == userHeight
          ? _value.userHeight
          : userHeight // ignore: cast_nullable_to_non_nullable
              as double,
      userGender: null == userGender
          ? _value.userGender
          : userGender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInUserStateImpl implements _LogInUserState {
  _$LogInUserStateImpl(
      {required this.userId,
      required this.userName,
      required this.userHeight,
      required this.userGender});

  @override
  final String userId;
  @override
  final String userName;
  @override
  final double userHeight;
  @override
  final String userGender;

  @override
  String toString() {
    return 'LogInUserState(userId: $userId, userName: $userName, userHeight: $userHeight, userGender: $userGender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInUserStateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userHeight, userHeight) ||
                other.userHeight == userHeight) &&
            (identical(other.userGender, userGender) ||
                other.userGender == userGender));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, userHeight, userGender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInUserStateImplCopyWith<_$LogInUserStateImpl> get copyWith =>
      __$$LogInUserStateImplCopyWithImpl<_$LogInUserStateImpl>(
          this, _$identity);
}

abstract class _LogInUserState implements LogInUserState {
  factory _LogInUserState(
      {required final String userId,
      required final String userName,
      required final double userHeight,
      required final String userGender}) = _$LogInUserStateImpl;

  @override
  String get userId;
  @override
  String get userName;
  @override
  double get userHeight;
  @override
  String get userGender;
  @override
  @JsonKey(ignore: true)
  _$$LogInUserStateImplCopyWith<_$LogInUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
