class ApiConfig {
  factory ApiConfig.pure() => ApiConfig(
        baseUrl: '',
        apiKey: '',
      );

  ApiConfig({
    required this.baseUrl,
    required this.apiKey,
  });

  final String baseUrl;

  final String apiKey;

  String get apiUrl => baseUrl;

  ApiConfig copyWith({
    String? baseUrl,
    String? apiKey,
  }) =>
      ApiConfig(
        baseUrl: baseUrl ?? this.baseUrl,
        apiKey: apiKey ?? this.apiKey,
      );
}
