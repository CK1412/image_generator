import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/resources/colors.dart';
import 'create_new_image_button.dart';
import 'feature_list.dart';
import 'image_list_in_gallery.dart';

class SidebarLeft extends ConsumerWidget {
  const SidebarLeft({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          const CreateNewImageButton(),
          const Expanded(
            flex: 2,
            child: ImageListInGallery(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: AppColors.lightGrey.withAlpha(100),
            ),
          ),
          const Expanded(
            child: FeatureList(),
          ),
        ],
      ),
    );
  }
}
