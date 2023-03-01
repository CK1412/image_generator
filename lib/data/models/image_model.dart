import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 0)
class ImageModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late Uint8List bytes;

  @HiveField(2)
  late DateTime createdAt;
}

class ImageModelFields {
  ImageModelFields._();

  static const String name = 'name';
  static const String bytes = 'bytes';
  static const String createdAt = 'createdAt';
}
