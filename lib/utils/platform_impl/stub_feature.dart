import 'dart:typed_data';

import 'base_feature.dart';

class FeatureImpl extends BaseFeature {
  @override
  Future<void> shareImage({
    required Uint8List bytes,
    String title = 'Great image',
    String fileName = 'image',
  }) {
    throw Exception('Stub implement');
  }

  @override
  Future<void> downloadImage({
    required Uint8List bytes,
    String? fileName,
  }) {
    throw Exception('Stub implement');
  }
}
