import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/image_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required TextEditingController textController,
    @Default(false) bool isSaveBtnActive,
    @Default(false) bool isGenerateBtnActive,
    @Default(false) bool isClearAllBtnActive,
    @Default(false) bool isGeneratingImage,
    @Default(false) bool isFreezedUI,
    ImageModel? tempImage,
    ImageModel? originalImage,
  }) = _DashboardState;

  factory DashboardState.init() => DashboardState(
        textController: TextEditingController(),
      );
}
