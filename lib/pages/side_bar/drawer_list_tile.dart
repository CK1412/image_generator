import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../constants/resources/colors.dart';
import '../../constants/resources/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.imageBytes,
    required this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final Uint8List imageBytes;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.bgDrawerListTile : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            selected: isSelected,
            iconColor: AppColors.grey,
            selectedColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.memory(imageBytes),
            ),
            title: Text(
              title,
              style: AppTextStyles.textRegular14.copyWith(
                color: isSelected ? AppColors.white : AppColors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: isSelected
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.white,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
