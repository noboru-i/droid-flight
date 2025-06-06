import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:droid_flight/pages/home/home_state.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    BetaAppData? app,
    @Default(false) bool isLoading,
    String? error,
  }) = _DetailState;
}