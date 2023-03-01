import 'package:flutter/material.dart';

import '../utils/utils.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.hideKeyboard(context);
      },
      child: child,
    );
  }
}
