import 'package:flutter/material.dart';

import '../../../constants/app_texts.dart';
import '../../../constants/resources/colors.dart';
import '../../../constants/resources/text_styles.dart';

class InputDataCard extends StatefulWidget {
  const InputDataCard({super.key});

  @override
  State createState() => _InputDataCardState();
}

class _InputDataCardState extends State<InputDataCard> {
  late TextEditingController _textController;

  bool isSaveBtnActive = false;
  bool isGenerateBtnActive = false;
  bool isClearAllBtnActive = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {
        isGenerateBtnActive = _textController.text.isNotEmpty;
        isClearAllBtnActive = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.titleTextField1,
            style: AppTextStyles.textRegular16.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.description1,
            style: AppTextStyles.textLight12.copyWith(
              color: AppColors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                ),
              ),
              style: AppTextStyles.textRegular14,
              maxLines: 5,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: CustomFilledButton(
                  isActive: isClearAllBtnActive,
                  title: AppTexts.btn3,
                  onPressed: _clearAllText,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomFilledButton(
                  isActive: isGenerateBtnActive,
                  title: AppTexts.btn2,
                  onPressed: _generateImage,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomFilledButton(
                  isActive: isSaveBtnActive,
                  title: AppTexts.btn4,
                  onPressed: _saveToList,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  void _generateImage() {
    // TODO
    if (!isSaveBtnActive) {
      setState(() {
        isSaveBtnActive = true;
      });
    }
  }

  void _clearAllText() {
    _textController.clear();
  }

  void _saveToList() {
    // TODO
    setState(() {
      isSaveBtnActive = false;
    });
  }
}

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
          backgroundColor: isActive ? null : AppColors.grey,
        ),
        child: Text(title),
      ),
    );
  }
}
