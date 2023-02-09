class ApiConfig {
  ApiConfig(
    this.baseUrl,
    this.apiKey,
  );

  final String baseUrl;

  final String apiKey;

  String get apiUrl => baseUrl;
}
