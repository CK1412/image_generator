import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../databases/hive/hive_client.dart';

final hiveClientProvider = Provider<HiveClient>((ref) {
  return HiveClient();
});
