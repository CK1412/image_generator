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
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = ref.read(dashboardViewModelProvider).textController;

    _textController.addListener(() {
      final value = _textController.text;

      ref
          .read(dashboardViewModelProvider.notifier)
          .setsIsGenerateBtnActive(value.isNotEmpty);
      ref
          .read(dashboardViewModelProvider.notifier)
          .setsIsClearAllBtnActive(value.isNotEmpty);
    });
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
        color: context.colors.bgDashboardBox,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.titleTextField1,
            style: AppTextStyles.textRegular16.copyWith(
              color: context.colors.textOnDashboardBox,
            ),
          ),
          Text(
            AppTexts.description1,
            style: AppTextStyles.textLight12.copyWith(
              color: context.colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colors.grey),
                ),
              ),
              style: AppTextStyles.textRegular14.copyWith(
                color: context.colors.textOnDashboardBox,
              ),
              maxLines: 5,
            ),
          ),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                CustomFilledButton(
                  isActive: isClearAllBtnActive,
                  title: AppTexts.btn3,
                  onPressed: _clearAllText,
                ),
                CustomFilledButton(
                  isActive: isGenerateBtnActive,
                  title: AppTexts.btn2,
                  onPressed: _generateImage,
                ),
                CustomFilledButton(
                  isActive: isSaveBtnActive,
                  title: AppTexts.btn4,
                  onPressed: _saveImage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateImage() async {
    await ref.read(dashboardViewModelProvider.notifier).generateImage();
  }

  void _clearAllText() {
    _textController.clear();
  }

  void _saveImage() {
    ref.read(dashboardViewModelProvider.notifier).saveImageToGallery();
  }
}
