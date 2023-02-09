import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../api/api_client.dart';
import '../api/api_config.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    client: http.Client(),
    apiConfig: ApiConfig(
      'https://api.openai.com/v1/images/generations',
      dotenv.env['API_KEY']!,
    ),
  );
});
