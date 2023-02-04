import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    String? inputText,
    String? imageUrl,
    @Default(false) bool isSaveBtnActive,
    @Default(false) bool isGenerateBtnActive,
    @Default(false) bool isClearAllBtnActive,
    @Default(false) bool isGeneratingImage,
  }) = _DashboardState;

  factory DashboardState.init() => const DashboardState();
}
