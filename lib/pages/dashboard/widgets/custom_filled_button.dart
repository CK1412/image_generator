
import 'package:flutter/material.dart';

import '../../../constants/resources/colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.isActive,
    required this.title,
    required this.onPressed,
  });

  final bool isActive;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isActive,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isActive ? null : context.colors.grey,
        ),
        child: Text(title),
      ),
    );
  }
}