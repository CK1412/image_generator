import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image_data.dart';

const _imageBox = 'images';

class HiveClient {
  HiveClient._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ImageDataAdapter());
    await Hive.openBox(_imageBox);
  }
}
