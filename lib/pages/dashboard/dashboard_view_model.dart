import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/constants.dart';
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

  void setIsFreezedUI(bool value) {
    state = state.copyWith(isFreezedUI: value);
  }

  void setImage(ImageModel? value) {
    state = state.copyWith(image: value);
  }

  Future<void> generateImage() async {
    if (state.inputText.isNullOrEmpty) {
      return;
    }

    setIsFreezedUI(true);
    setIsGeneratingImage(true);
    logger.d('Generating image...');

    // await Future.delayed(const Duration(seconds: 2));

    setImageUrl(Constants.image1);
    // setImageUrl(
    //     'https://oaidalleapiprodscus.blob.core.windows.net/private/org-hrmTDhMF7EYMENxPVjKbrjIy/user-ncs1YMXaZbAjskqynnW7Ps2P/img-jeC6jhVDFMloUDvYbVEqpmS6.png?st=2023-02-12T13%3A59%3A47Z&se=2023-02-12T15%3A59%3A47Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-02-12T13%3A19%3A15Z&ske=2023-02-13T13%3A19%3A15Z&sks=b&skv=2021-08-06&sig=DdTtZt7C2%2BfdO985EaaBPq/9l8%2Bd%2B4pv6DERtdVVqQ0%3D');
    initImageModel(state.imageUrl!);
    setsIsSaveBtnActive(true);

    // final imageUrl = await apiClient.createImage(
    //   textDescription: state.inputText!,
    // );

    // if (imageUrl.isNotEmpty) {
    //   setImageUrl(imageUrl);
    //   logger.i('Generate image successfully: $imageUrl');

    //   setsIsSaveBtnActive(true);
    //   autoCreateImageData(imageUrl);
    // } else {
    //   logger.e('Generate image failed.');
    // }

    setIsFreezedUI(false);
    setIsGeneratingImage(false);
  }

  Future<void> initImageModel(String imgUrl) async {
    final imgData = ImageModel()
      ..name = state.inputText ?? ''
      ..createdAt = DateTime.now()
      ..bytes = await Utils.urlToUint8List(imgUrl);

    setImage(imgData);
  }

  Future<void> downloadImage() async {
    setIsFreezedUI(true);

    if (state.image != null) {
      await Utils.featurePlatform.downloadImage(
        bytes: state.image!.bytes,
        fileName: state.image!.name,
      );
    }

    setIsFreezedUI(false);
  }

  Future<void> shareImage() async {
    setIsFreezedUI(true);

    if (state.image != null) {
      await Utils.featurePlatform.shareImage(
        bytes: state.image!.bytes,
        fileName: state.image!.name,
      );
    }

    setIsFreezedUI(false);
  }

  void saveImageToGallery() {
    hiveClient.dbImageDao.add(state.image);

    setsIsSaveBtnActive(false);
  }
}
