import '../../data/api/api_client.dart';
import '../../data/providers/api_client_provider.dart';
import '../../utils/extensions/string_extension.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void setInputText(String? value) {
    state = state.copyWith(inputText: value);
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

  void setImageUrl(String? value) {
    state = state.copyWith(imageUrl: value);
  }

  void setIsGeneratingImage(bool value) {
    state = state.copyWith(isGeneratingImage: value);
  }

  Future<void> generateImage() async {
    if (state.inputText.isNullOrEmpty) {
      return;
    }

    setIsGeneratingImage(true);
    logger.d('Generating image...');

    // await Future.delayed(const Duration(seconds: 2));

    // setImageUrl(Constants.image1);

    final imageUrl = await apiClient.createImage(
      textDescription: state.inputText!,
    );

    if (imageUrl.isNotEmpty) {
      setImageUrl(imageUrl);
      logger.i('Generate image successfully.');
    } else {
      logger.e('Generate image failed.');
    }

    setIsGeneratingImage(false);
  }
}
