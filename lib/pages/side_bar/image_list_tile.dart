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
        color: isSelected ? context.colors.bgDrawerListTile : null,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        selected: isSelected,
        iconColor: context.colors.grey,
        hoverColor: context.colors.hoverListTile,
        selectedColor: context.colors.white,
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
            color: isSelected ? context.colors.white : context.colors.grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: isSelected
            ? IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: context.colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
