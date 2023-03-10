import 'package:flutter/material.dart';

import '../../constants/resources/colors.dart';
import '../../constants/resources/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: ListTile(
        iconColor: context.colors.white,
        selectedColor: context.colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        hoverColor: context.colors.hoverListTile,
        title: Text(
          title,
          style: AppTextStyles.textRegular14.copyWith(
            color: context.colors.white,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: Icon(iconData),
        onTap: onTap,
      ),
    );
  }
}
