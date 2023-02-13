import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image_model.dart';
import 'db_image_dao.dart';
import 'hive_boxes.dart';

class HiveClient {
  HiveClient();

  DbImageDao? _dbImageDao;

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ImageModelAdapter());

    await Hive.openBox<ImageModel>(
      HiveBoxName.image,
      compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 50;
      },
    );
  }
}

extension HiveClientDao on HiveClient {
  DbImageDao get dbImageDao {
    if (_dbImageDao != null) {
      return _dbImageDao!;
    }

    return DbImageDao(
      Hive.box(HiveBoxName.image),
    );
  }
}
