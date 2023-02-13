import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import 'base_feature.dart';

class FeatureImpl extends BaseFeature {
  @override
  Future<void> shareImage({
    required Uint8List bytes,
    String title = 'Great image',
    String fileName = 'image',
  }) async {
    await Share.shareXFiles(
      [XFile.fromData(bytes)],
      subject: title,
    );
  }

  @override
  Future<void> downloadImage({
    required Uint8List bytes,
    String? fileName,
  }) async {
    await ImageGallerySaver.saveImage(bytes, name: fileName);
  }
}
