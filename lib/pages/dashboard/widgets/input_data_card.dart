import 'package:flutter/material.dart';

import '../../../constants/resources/colors.dart';

class InputDataCard extends StatefulWidget {
  const InputDataCard({super.key});

  @override
  State<InputDataCard> createState() => _InputDataCardState();
}

class _InputDataCardState extends State<InputDataCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
