import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(<String, List<BetaAppData>>{})
    Map<String, List<BetaAppData>> betaApps,
    @Default('All') String selectedFilter,
  }) = _HomeState;
}

@freezed
class BetaAppData with _$BetaAppData {
  const factory BetaAppData({
    required String applicationId,
    required String image,
    required String name,
    required List<String> tags,
    String? section,
  }) = _BetaAppData;
}
