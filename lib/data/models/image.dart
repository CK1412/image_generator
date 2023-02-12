import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'image.g.dart';

@HiveType(typeId: 0)
class Image extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late Uint8List bytes;

  @HiveField(2)
  late DateTime createAt;
}
