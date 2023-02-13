import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_texts.dart';
import '../../constants/resources/colors.dart';
import '../../data/databases/hive/hive_client.dart';
import '../../data/models/image_model.dart';
import '../../data/providers/hive_client_provider.dart';
import 'drawer_list_tile.dart';

class SidebarLeft extends ConsumerStatefulWidget {
  const SidebarLeft({super.key});

  @override
  ConsumerState createState() => _SidebarLeftState();
}

class _SidebarLeftState extends ConsumerState<SidebarLeft> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(AppTexts.btn1),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                foregroundColor: AppColors.white,
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: ImageListInGallery(),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class ImageListInGallery extends ConsumerWidget {
  const ImageListInGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageBox = ref.watch(hiveClientProvider).dbImageDao.box;

    return ValueListenableBuilder<Box<ImageModel>>(
      valueListenable: imageBox.listenable(),
      builder: (context, box, child) {
        final images = box.values.toList();
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            return DrawerListTile(
              imageBytes: images[index].bytes,
              title: images[index].name,
              onPressed: () {},
              isSelected: true,
            );
          },
        );
      },
    );
  }
}
