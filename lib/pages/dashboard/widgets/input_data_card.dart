import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_texts.dart';
import '../../../constants/resources/colors.dart';
import '../../../constants/resources/text_styles.dart';
import '../dashboard_view_model.dart';
import 'custom_filled_button.dart';

class InputDataCard extends ConsumerStatefulWidget {
  const InputDataCard({super.key});

  @override
  ConsumerState createState() => _InputDataCardState();
}

class _InputDataCardState extends ConsumerState<InputDataCard> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      final value = _textController.text;

      ref.read(dashboardViewModelProvider.notifier).setInputText(value);
      ref
          .read(dashboardViewModelProvider.notifier)
          .setsIsGenerateBtnActive(value.isNotEmpty);
      ref
          .read(dashboardViewModelProvider.notifier)
          .setsIsClearAllBtnActive(value.isNotEmpty);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final isClearAllBtnActive = dashboardState.isClearAllBtnActive;
    final isGenerateBtnActive = dashboardState.isGenerateBtnActive;
    final isSaveBtnActive = dashboardState.isSaveBtnActive;

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
          Expanded(
            child:
                Text(ref.watch(dashboardViewModelProvider).inputText ?? 'null'),
          )
        ],
      ),
    );
  }

  Future<void> _generateImage() async {
    await ref.read(dashboardViewModelProvider.notifier).generateImage();

    // TODO

    if (!ref.watch(dashboardViewModelProvider).isSaveBtnActive) {
      ref.read(dashboardViewModelProvider.notifier).setsIsSaveBtnActive(true);
    }
  }

  void _clearAllText() {
    _textController.clear();
  }

  void _saveToList() {
    // TODO
    ref.read(dashboardViewModelProvider.notifier).setsIsSaveBtnActive(false);
  }
}
