import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    String? currentImageUrl,
  }) = _DashboardState;

  factory DashboardState.init() => const DashboardState();
}
