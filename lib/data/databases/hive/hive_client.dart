import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image.dart';

const _imageBox = 'images';

class HiveClient {
  HiveClient._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ImageAdapter());
    await Hive.openBox(_imageBox);
  }
}
