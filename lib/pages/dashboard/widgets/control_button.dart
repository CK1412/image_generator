import 'package:flutter/material.dart';

import '../../../constants/resources/colors.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.child,
    required this.onTap,
  });
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: context.colors.lightGrey,
        ),
        child: child,
      ),
    );
  }
}
