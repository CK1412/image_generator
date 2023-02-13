import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image_model.dart';
import 'hive_boxes.dart';

class HiveClient {
  HiveClient._();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ImageModelAdapter());

    await Hive.openBox(
      HiveBoxName.image,
      compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 50;
      },
    );
  }
}
