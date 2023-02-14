import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../constants/resources/colors.dart';
import '../../constants/resources/text_styles.dart';

class ImageListTile extends StatelessWidget {
  const ImageListTile({
    super.key,
    required this.title,
    required this.imageBytes,
    required this.onSelected,
    required this.onDelete,
    this.isSelected = false,
  });

  final String title;
  final Uint8List imageBytes;
  final VoidCallback onSelected;
  final VoidCallback onDelete;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.bgDrawerListTile : null,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        selected: isSelected,
        iconColor: AppColors.grey,
        hoverColor: AppColors.hoverListTile,
        selectedColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.memory(imageBytes),
        ),
        onTap: onSelected,
        title: Text(
          title,
          style: AppTextStyles.textRegular14.copyWith(
            color: isSelected ? AppColors.white : AppColors.grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: isSelected
            ? IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.white,
                ),
              )
            : null,
      ),
    );
  }
}
