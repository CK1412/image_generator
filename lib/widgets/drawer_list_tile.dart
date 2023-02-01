
import 'package:flutter/material.dart';

import '../constants/resources/colors.dart';
import '../constants/resources/text_styles.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.onPressed,
    this.isSelected = false,
  });

  final String title;
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
            leading: const Icon(
              Icons.image,
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
