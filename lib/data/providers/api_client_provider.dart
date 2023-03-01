import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../api/api_client.dart';
import 'app_flavor_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final appFlavor = ref.read(appFlavorProvider);

  return ApiClient(
    client: http.Client(),
    apiConfig: appFlavor.apiConfig,
  );
});
