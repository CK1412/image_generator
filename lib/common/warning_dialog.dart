import 'package:flutter/material.dart';

import '../constants/resources/colors.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.onPositiveButtonTap,
    this.onNegativeButtonTap,
    this.message,
    required this.positiveButtonText,
    this.negativeButtonText,
    required this.title,
  });

  final String title;
  final String? message;
  final String positiveButtonText;
  final VoidCallback onPositiveButtonTap;
  final String? negativeButtonText;
  final VoidCallback? onNegativeButtonTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message != null ? Text(message!) : null,
      backgroundColor: AppColors.bgDashboard,
      actions: [
        if (negativeButtonText != null && onNegativeButtonTap != null)
          TextButton(
            onPressed: onNegativeButtonTap,
            child: Text(negativeButtonText!),
          ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: AppColors.red),
          onPressed: () {
            onPositiveButtonTap();
            Navigator.of(context).pop();
          },
          child: Text(positiveButtonText),
        ),
      ],
    );
  }
}
