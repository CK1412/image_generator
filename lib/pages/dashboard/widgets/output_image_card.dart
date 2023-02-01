import 'package:flutter/material.dart';

import '../../../constants/resources/colors.dart';

class OutputImageCard extends StatefulWidget {
  const OutputImageCard({super.key});

  @override
  State<OutputImageCard> createState() => _OutputImageCardState();
}

class _OutputImageCardState extends State<OutputImageCard> {
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
