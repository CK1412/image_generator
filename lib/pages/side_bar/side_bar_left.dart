import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_texts.dart';
import '../../constants/resources/colors.dart';
import '../../data/databases/hive/hive_client.dart';
import '../../data/models/image_model.dart';
import '../../data/providers/hive_client_provider.dart';
import '../dashboard/dashboard_view_model.dart';
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

class ImageListInGallery extends ConsumerStatefulWidget {
  const ImageListInGallery({
    super.key,
  });

  @override
  ConsumerState createState() => _ImageListInGalleryState();
}

class _ImageListInGalleryState extends ConsumerState<ImageListInGallery> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageBox = ref.watch(hiveClientProvider).dbImageDao.box;

    return ValueListenableBuilder<Box<ImageModel>>(
      valueListenable: imageBox.listenable(),
      builder: (context, box, child) {
        final images = box.values.toList().reversed.toList();

        return RawScrollbar(
          thumbColor: AppColors.lightGrey,
          radius: const Radius.circular(6),
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: box.length,
            itemBuilder: (context, index) {
              final isSelected = images[index] ==
                  ref.watch(dashboardViewModelProvider).originalImage;

              return DrawerListTile(
                imageBytes: images[index].bytes,
                title: images[index].name,
                onSelected: () {
                  _selectedListTile(images[index]);
                },
                onDelete: () {
                  images[index].delete();
                },
                isSelected: isSelected,
              );
            },
          ),
        );
      },
    );
  }

  void _selectedListTile(ImageModel image) {
    ref.read(dashboardViewModelProvider.notifier).setOriginalImage(image);

    ref.read(dashboardViewModelProvider.notifier).setTempImage(image);
    ref.read(dashboardViewModelProvider.notifier).setInputText(image.name);
  }
}
