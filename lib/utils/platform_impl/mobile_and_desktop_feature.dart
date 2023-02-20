import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:image/image.dart';
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
  Future<bool> downloadImageAsPng({
    required Uint8List bytes,
    String? fileName,
  }) async {
    try {
      if (Platform.isWindows) {
        final path = await getSavePath(
          suggestedName: '$fileName.png',
          acceptedTypeGroups: [
            const XTypeGroup(
              label: '.png',
              extensions: ['png'],
            )
          ],
        );

        if (path == null) {
          // Operation was canceled by the user.
          return false;
        }

        final image = decodeImage(bytes);

        if (image == null) return false;

        File file = File(path);

        file.writeAsBytesSync(encodePng(image));
      } else {
        await ImageGallerySaver.saveImage(bytes, name: fileName);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
