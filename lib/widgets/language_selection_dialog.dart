import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import '../data/language_data.dart';

class LanguageSelectionDialog extends StatelessWidget {
  final List<LanguageData> languages;
  final Function(LanguageData) onLanguageSelected;
  final String title;

  const LanguageSelectionDialog({
    super.key,
    required this.languages,
    required this.onLanguageSelected,
    this.title = "Select Language",
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxDialogHeight = MediaQuery.of(context).size.height * 0.6;

    final itemHeight = 48.0;
    final estimatedListHeight = languages.length * itemHeight;
    final listHeight = estimatedListHeight > maxDialogHeight
        ? maxDialogHeight
        : estimatedListHeight;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: Container(
        width: screenWidth * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: AppDimensions.paddingLeftMedium,
              height: 50.h,
              color: Theme.of(context).cardColor,
              width: double.infinity,
              child: Row(
                children: [
                  CommonText(
                    text: title,
                    fontSize: AppDimensions.fontXMedium,
                    color: AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.semiBold,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppTheme().getSubFontColor(context),
                    ),
                  ),
                  Spacing.width(20),
                ],
              ),
            ),
            Spacing.height(16),
            SizedBox(
              height: listHeight,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return InkWell(
                    onTap: () {
                      onLanguageSelected(lang);
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingMedium - 6,
                          horizontal: AppDimensions.paddingMedium - 2),
                      child: CommonText(
                        text: lang.name.capitalizeFirstLetter(),
                        fontSize: AppDimensions.fontXMedium - 1,
                        color: AppTheme().getFontColor(context),
                        fontWeight: AppFontWeights.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
