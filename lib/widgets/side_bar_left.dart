import 'package:flutter/material.dart';

import '../constants/app_texts.dart';
import '../constants/resources/colors.dart';
import 'drawer_list_tile.dart';

class SidebarLeft extends StatefulWidget {
  const SidebarLeft({super.key});

  @override
  State<SidebarLeft> createState() => _SidebarLeftState();
}

class _SidebarLeftState extends State<SidebarLeft> {
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
              label: const Text(AppTexts.createNewImage),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                foregroundColor: AppColors.white,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                DrawerListTile(
                  title: 'Image 1 sđ f sf f gsgsfs s tstst sts t tsr tst ',
                  onPressed: () {},
                ),
                DrawerListTile(
                  title: 'Image 1',
                  onPressed: () {},
                ),
                DrawerListTile(
                  title: 'Image 1',
                  onPressed: () {},
                  isSelected: true,
                ),
              ],
            ),
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
