import 'dart:convert';

import 'package:http/http.dart';

import 'api_config.dart';

class ApiClient {
  ApiClient({
    required this.client,
    required this.apiConfig,
  });

  final Client client;
  final ApiConfig apiConfig;

  // return b64_json format
  Future<String> createImage({
    required String textDescription,
    int quantity = 1,
    String size = '512x512',
  }) async {
    final response = await client.post(
      Uri.parse(apiConfig.apiUrl),
      headers: {
        'Authorization': 'Bearer ${apiConfig.apiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': textDescription,
        'n': quantity,
        'size': size,
        'response_format': 'b64_json'
      }),
    );

    if (response.statusCode == 200) {
      final imageUrl = jsonDecode(response.body)['data'][0]['b64_json'];
      return imageUrl;
    } else {
      return '';
    }
  }
}
