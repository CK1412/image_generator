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
    setImageUrl(
        'https://oaidalleapiprodscus.blob.core.windows.net/private/org-hrmTDhMF7EYMENxPVjKbrjIy/user-ncs1YMXaZbAjskqynnW7Ps2P/img-lY2LeM8vN33Y8G1pnnktobxr.png?st=2023-02-12T07%3A17%3A36Z&se=2023-02-12T09%3A17%3A36Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-02-11T21%3A38%3A08Z&ske=2023-02-12T21%3A38%3A08Z&sks=b&skv=2021-08-06&sig=MaoE5gGIkV7OjagdnDDtl4Hnz/tIJWu6q0Qx%2BDXHlgw%3D');

    // final imageUrl = await apiClient.createImage(
    //   textDescription: state.inputText!,
    // );

    // if (imageUrl.isNotEmpty) {
    //   setImageUrl(imageUrl);
    //   logger.i('Generate image successfully.');

    //   if (!state.isSaveBtnActive) {
    //     setsIsSaveBtnActive(true);
    //   }
    // } else {
    //   logger.e('Generate image failed.');
    // }

    setIsGeneratingImage(false);
  }

  Future<void> downloadImage() async {

  }
}
