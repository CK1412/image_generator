import 'package:flutter/material.dart';

import '../../../constants/resources/colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.isActive,
    required this.title,
    required this.onPressed,
    this.width = 100,
  });

  final bool isActive;
  final String title;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isActive,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: isActive ? null : context.colors.grey,
          fixedSize: Size.fromWidth(width),
        ),
        child: Text(title),
      ),
    );
  }
}
