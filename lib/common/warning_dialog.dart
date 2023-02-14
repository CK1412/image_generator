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
      title: Text(
        title,
        style: TextStyle(color: context.colors.titleDialog),
      ),
      content: message != null
          ? Text(
              message!,
              style: TextStyle(color: context.colors.titleDialog),
            )
          : null,
      backgroundColor: context.colors.bgDialog,
      actions: [
        if (negativeButtonText != null && onNegativeButtonTap != null)
          TextButton(
            onPressed: onNegativeButtonTap,
            child: Text(negativeButtonText!),
          ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: context.colors.red),
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
