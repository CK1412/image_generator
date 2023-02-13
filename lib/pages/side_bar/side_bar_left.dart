import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_texts.dart';
import '../../constants/resources/colors.dart';
import '../dashboard/dashboard_view_model.dart';
import 'image_list_in_gallery.dart';

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
              onPressed: _createNewImage,
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

  void _createNewImage() {
    ref.read(dashboardViewModelProvider.notifier).resetData();
  }
}
