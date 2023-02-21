import '../data/api/api_config.dart';

enum AppFlavorType {
  development,
  production,
}

extension AppFlavorTypeExtension on AppFlavorType {
  bool get isDevelopment => this == AppFlavorType.development;
  bool get isProduction => this == AppFlavorType.production;
}

class AppFlavor {
  const AppFlavor({
    required this.appFlavorType,
    required this.apiConfig,
  });

  final AppFlavorType appFlavorType;
  final ApiConfig apiConfig;

  AppFlavor copyWith({
    AppFlavorType? appFlavorType,
    ApiConfig? apiConfig,
  }) =>
      AppFlavor(
        appFlavorType: appFlavorType ?? this.appFlavorType,
        apiConfig: apiConfig ?? this.apiConfig,
      );
}

class AppFlavorValue {
  static final AppFlavor development = AppFlavor(
    appFlavorType: AppFlavorType.development,
    apiConfig: ApiConfig(
      baseUrl: 'https://api.openai.com/v1/images',
      apiKey: '',
    ),
  );

  static final AppFlavor production = AppFlavor(
    appFlavorType: AppFlavorType.production,
    apiConfig: ApiConfig(
      baseUrl: 'https://api.openai.com/v1/images',
      apiKey: '',
    ),
  );
}
