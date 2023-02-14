import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_texts.dart';
import '../../data/databases/hive/hive_client.dart';
import '../../data/providers/hive_client_provider.dart';
import '../../utils/utils.dart';
import 'drawer_list_tile.dart';

class FeatureList extends ConsumerStatefulWidget {
  const FeatureList({
    super.key,
  });

  @override
  ConsumerState createState() => _FeatureListState();
}

class _FeatureListState extends ConsumerState<FeatureList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Clear all images
        ValueListenableBuilder(
          valueListenable:
              ref.watch(hiveClientProvider).dbImageDao.box.listenable(),
          builder: (context, box, child) {
            if (box.isNotEmpty) {
              return DrawerListTile(
                title: AppTexts.titleListTile1,
                iconData: Icons.delete_rounded,
                onTap: _clearAllImages,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  void _clearAllImages() {
    Utils.showWarningAlertDialog(
      context,
      title: AppTexts.titleDialog1,
      positiveButtonText: AppTexts.btn3,
      onPositiveButtonTap: () {
        ref.read(hiveClientProvider).dbImageDao.deleteAll();
      },
      negativeButtonText: AppTexts.btn5,
      onNegativeButtonTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
