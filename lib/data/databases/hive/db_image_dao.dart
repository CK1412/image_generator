import 'package:hive_flutter/hive_flutter.dart';

import '../../models/image_model.dart';

class DbImageDao {
  DbImageDao(this.box);

  final Box<ImageModel> box;

  List<ImageModel> get getAll => box.values.toList();

  void add(ImageModel? data) {
    if (data != null) {
      box.add(data);
    }
  }

  void save(ImageModel? data) {
    if (data != null) {
      data.save();
    }
  }

  void delete(ImageModel? data) {
    if (data != null) {
      data.delete();
    }
  }
}
