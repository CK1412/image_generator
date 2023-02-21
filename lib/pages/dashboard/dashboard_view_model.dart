import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/api/api_client.dart';
import '../../data/databases/hive/hive_client.dart';
import '../../data/models/image_model.dart';
import '../../data/providers/api_client_provider.dart';
import '../../data/providers/hive_client_provider.dart';
import '../../utils/extensions/string_extension.dart';
import '../../utils/utils.dart';
import 'dashboard_state.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return DashboardState.init();
  }

  final logger = Logger();

  ApiClient get apiClient => ref.read(apiClientProvider);

  HiveClient get hiveClient => ref.read(hiveClientProvider);

  String? get inputText => state.textController.text;

  void setInputText(String value) {
    state.textController.text = value;
  }

  void setsIsSaveBtnActive(bool value) {
    state = state.copyWith(isSaveBtnActive: value);
  }

  void setsIsClearAllBtnActive(bool value) {
    state = state.copyWith(isClearAllBtnActive: value);
  }

  void setsIsGenerateBtnActive(bool value) {
    state = state.copyWith(isGenerateBtnActive: value);
  }

  void setIsGeneratingImage(bool value) {
    state = state.copyWith(isGeneratingImage: value);
  }

  void setIsFreezedUI(bool value) {
    state = state.copyWith(isFreezedUI: value);
  }

  void setTempImage(ImageModel? value) {
    state = state.copyWith(tempImage: value);
  }

  void setOriginalImage(ImageModel? value) {
    state = state.copyWith(originalImage: value);
  }

  Future<void> generateImage() async {
    if (inputText.isNullOrEmpty) {
      return;
    }

    setIsFreezedUI(true);
    setIsGeneratingImage(true);
    logger.d('Generating image...');

    try {
      final imageB64 = await apiClient.createImage(
        textDescription: inputText!,
      );

      if (imageB64.isNotEmpty) {
        logger.i('Generate image successfully');

        await initImageModel(imageB64);

        setsIsSaveBtnActive(true);
      } else {
        logger.e('Generate image failed.');
      }
    }
    //
    finally {
      setIsFreezedUI(false);
      setIsGeneratingImage(false);
    }
  }

  Future<void> initImageModel(String b64Json) async {
    final imgData = ImageModel()
      ..name = inputText ?? ''
      ..createdAt = DateTime.now()
      ..bytes = base64Decode(b64Json);

    setOriginalImage(imgData);
    setTempImage(imgData);
  }

  Future<bool> downloadImage() async {
    try {
      setIsFreezedUI(true);

      if (state.tempImage != null) {
        return await Utils.featurePlatform.downloadImageAsPng(
          bytes: state.tempImage!.bytes,
          fileName: state.tempImage!.name,
        );
      } else {
        return false;
      }
    } finally {
      setIsFreezedUI(false);
    }
  }

  Future<void> shareImage() async {
    try {
      setIsFreezedUI(true);

      if (state.tempImage != null) {
        await Utils.featurePlatform.shareImage(
          bytes: state.tempImage!.bytes,
          fileName: state.tempImage!.name,
        );
      }
    } finally {
      setIsFreezedUI(false);
    }
  }

  void saveImageToGallery() {
    hiveClient.dbImageDao.add(state.tempImage);

    setsIsSaveBtnActive(false);
  }

  void resetData() {
    state = state.copyWith(
      isFreezedUI: false,
      isClearAllBtnActive: false,
      isGenerateBtnActive: false,
      isGeneratingImage: false,
      isSaveBtnActive: false,
      originalImage: null,
      tempImage: null,
    );

    state.textController.clear();
  }
}
