import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'dashboard_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_view_model.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return DashboardState.init();
  }

  final _apiClient = http.Client();

  final _apiKey = dotenv.env['API_KEY'];
  final _baseUrl = 'https://api.openai.com/v1/images/generations';

  final logger = Logger();

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

  Future<void> generateImage() async {
    if (state.inputText!.isEmpty) {
      return;
    }

    logger.d('Generating image...');

    final response = await _apiClient.post(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': state.inputText,
        'n': 1,
        'size': '512x512',
      }),
    );

    if (response.statusCode == 200) {
      final imageUrl = jsonDecode(response.body)['data'][0]['url'];

      setImageUrl(imageUrl);

      logger.i('Generate image successfully.');
    } else {
      setImageUrl('');
      logger.e('Generate image failed.');
    }
  }
}
