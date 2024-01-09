import 'package:freezed_annotation/freezed_annotation.dart';

part 'datetime_state.freezed.dart';

@freezed
class DateTimeState with _$DateTimeState {
  const factory DateTimeState({
    required DateTime value,
  }) = _DateTimeState;
}
