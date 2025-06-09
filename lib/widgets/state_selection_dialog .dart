import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import '../../data/state_data.dart'; // your states data
import '../../controller/settings/settings_controller.dart';
import '../data/language_data.dart';

class StateSelectionDialog extends StatelessWidget {
  final SettingsController sController = Get.find();
  final LanguageController languageController = Get.find();

  final String? title;
  StateSelectionDialog({super.key, this.title });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = S.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      child: Container(
        height: screenHeight * 0.9,
        width: screenWidth * 0.9,
        padding: EdgeInsets.symmetric(horizontal:AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.height(18),
            Row(
              children: [
                CommonText(
                  text:l10n.selectState,
                  fontSize: AppDimensions.fontLarge-2,
                  color:AppTheme().getFontColor(context),
                  fontWeight: AppFontWeights.semiBold,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.close,color: AppTheme().getSubFontColor(context)),
                )
              ],
            ),
            Spacing.height(18),
            TextField(
              decoration: InputDecoration(
                hintText: l10n.searchState,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              onChanged: (value) {
                sController.filter.value = value;
                sController.filterList();
              },
            ),
            Spacing.height(12),
            Expanded(
              child: GetBuilder<SettingsController>(
                builder: (controller) => sController.filteredStates.isNotEmpty
                    ? ListView.builder(
                  itemCount: sController.filteredStates.length,
                  itemBuilder: (context, index) {
                    final stateLang = sController.filteredStates[index];
                    return InkWell(
                      onTap: () {
                        controller.setSelectedState(stateLang.state);
                        languageController.selectedLanguage.value = null;

                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical:AppDimensions.paddingSmall+4, horizontal: AppDimensions.paddingSmall-4),
                        child: CommonText(
                          text:stateLang.state,
                          fontSize: AppDimensions.fontMedium,
                          color:AppTheme().getFontColor(context),
                          fontWeight: AppFontWeights.normal,
                        ),
                      ),
                    );
                  },
                )
                    : Center(
                  child: CommonText(
                    text:l10n.noStatesFound,
                    fontSize: AppDimensions.fontXMedium,
                    color:AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
