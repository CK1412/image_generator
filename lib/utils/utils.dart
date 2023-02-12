import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_downloader_web/image_downloader_web.dart';

class Utils {
  Utils._();

  static bool get isWeb => kIsWeb;

  static Future<Uint8List> urlToUint8List(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  static Future<void> downloadImage({
    required Uint8List bytes,
    String? fileName,
  }) async {
    if (isWeb) {
      await WebImageDownloader.downloadImageFromUInt8List(
          uInt8List: bytes, name: fileName);
    } else {
      //
    }
  }
}
