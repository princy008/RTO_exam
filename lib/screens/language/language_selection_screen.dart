import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/data/state_data.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import '../../data/language_data.dart';
import '../home/home_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});

  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: l10n.welcomeTORTOExam,
              fontSize: AppDimensions.fontXLarge,
              color: Theme.of(context).primaryColor,
              fontWeight: AppFontWeights.bold,
            ),
            Spacing.height(10),
            CommonText(
              text: l10n.pleaseSelectStateLanguage,
              fontSize: AppDimensions.fontMedium,
              color: AppColors.blackColor,
              fontWeight: AppFontWeights.medium,
            ),
            Spacing.height(40),
            Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                    vertical: AppDimensions.paddingSmall - 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blueGrey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: CommonText(
                    text: l10n.selectState,
                    fontSize: AppDimensions.fontMedium,
                    color: AppColors.blueLightGray,
                    fontWeight: AppFontWeights.medium,
                  ),
                  value: controller.selectedState.value,
                  items: stateLanguageList.map((stateLang) {
                    return DropdownMenuItem<String>(
                      value: stateLang.state,
                      child: CommonText(
                        text: stateLang.state,
                        fontSize: AppDimensions.fontMedium,
                        color: AppColors.blackColor,
                        fontWeight: AppFontWeights.semiBold,
                      ),
                    );
                  }).toList(),
                  onChanged: controller.setSelectedState,
                ),
              );
            }),
            Spacing.height(25),
            Obx(() {
              if (controller.selectedState.value == null)
                return SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: l10n.selectLanguage,
                    fontSize: AppDimensions.fontMedium,
                    color: AppColors.blueLightGray,
                    fontWeight: AppFontWeights.bold,
                  ),
                  Spacing.height(10),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMedium,
                        vertical: AppDimensions.paddingSmall - 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blueGrey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: DropdownButton<LanguageData>(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: CommonText(
                        text: l10n.selectLanguage,
                        fontSize: AppDimensions.fontMedium,
                        color: AppColors.blueLightGray,
                        fontWeight: AppFontWeights.medium,
                      ),
                      value: controller.selectedLanguage.value,
                      items: controller.languagesForState.map((lang) {
                        return DropdownMenuItem<LanguageData>(
                          value: lang,
                          child: CommonText(
                            text: lang.display,
                            fontSize: AppDimensions.fontMedium,
                            color: AppColors.blackColor,
                            fontWeight: AppFontWeights.semiBold,
                          ),
                        );
                      }).toList(),
                      onChanged: controller.setSelectedLanguage,
                    ),
                  ),
                  Spacing.height(40),
                ],
              );
            }),
            Obx(() {
              final enabled = controller.selectedState.value != null &&
                  controller.selectedLanguage.value != null;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: enabled
                      ? () {
                          Get.to(HomeScreen());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.paddingMedium),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    backgroundColor: enabled
                        ? Theme.of(context).primaryColor
                        : AppColors.blueGrey,
                  ),
                  child: CommonText(
                    text: l10n.continueGO,
                    fontSize: AppDimensions.fontXMedium,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
