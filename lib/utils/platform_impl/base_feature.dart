import 'dart:typed_data';

abstract class BaseFeature {
  Future<void> shareImage({
    required Uint8List bytes,
    String title = 'Great image',
    String fileName = 'image',
  });

  Future<bool> downloadImageAsPng({
    required Uint8List bytes,
    String? fileName,
  });
}
