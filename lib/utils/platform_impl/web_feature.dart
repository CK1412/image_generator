// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:image_downloader_web/image_downloader_web.dart';

import 'base_feature.dart';

class FeatureImpl extends BaseFeature {
  @override
  Future<void> shareImage({
    required Uint8List bytes,
    String title = 'Great image',
    String fileName = 'image',
  }) async {
    final shareData = {
      "title": title,
      "files": [
        html.File(
          [bytes],
          '$fileName.png',
          {
            "type": "image/png",
          },
        ),
      ]
    };
    await html.window.navigator.share(shareData);
  }

  @override
  Future<void> downloadImage({
    required Uint8List bytes,
    String? fileName,
  }) async {
    await WebImageDownloader.downloadImageFromUInt8List(
      uInt8List: bytes,
      name: fileName,
    );
  }
}
