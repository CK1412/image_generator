import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'platform_impl/stub_feature.dart'
    if (dart.library.io) 'platform_impl/mobile_feature.dart'
    if (dart.library.html) 'platform_impl/web_feature.dart';

class Utils {
  Utils._();

  static bool get isWeb => kIsWeb;

  static final FeatureImpl _feature = FeatureImpl();

  static FeatureImpl get featurePlatform => _feature;

  static Future<Uint8List> urlToUint8List(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  static void showSnackbar(
    BuildContext context, {
    bool onlyMobile = true,
    required String text,
  }) async {
    if ((onlyMobile && !isWeb) || !onlyMobile) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }
  }
}
