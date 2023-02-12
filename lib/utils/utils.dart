import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Utils {
  Utils._();

  static Future<Uint8List> urlToUint8List(String url) async {
    final response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}
