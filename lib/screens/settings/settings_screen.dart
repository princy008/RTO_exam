import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/controller/settings/settings_controller.dart';
import 'package:rto_exam/controller/theme/theme_controller.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/dark_mode_dialog.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import '../../data/state_data.dart';
import '../../widgets/language_selection_dialog.dart';
import '../../widgets/state_selection_dialog .dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController settingsController = Get.put(SettingsController());
  final LanguageController controller = Get.put(LanguageController());
  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return WillPopScope(
      onWillPop: () async {
        controller.onBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: AppTheme().getQuizBackgroundColor(context),
        appBar: CommonAppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: l10n.settings,
            textColor: AppColors.backGroundColor,
            leading: InkWell(
              onTap: () {
                controller.onBack();
              },
              child: Icon(Icons.arrow_back, color: AppColors.blackColor),
            ),
            actions: [
              // Center(
              //     child: Padding(
              //         padding: AppDimensions.paddingRightMedium,
              //         child: CommonText(
              //           text: l10n.getVersion,
              //           fontSize: AppDimensions.fontMedium,
              //           color: AppColors.backGroundColor,
              //           fontWeight: AppFontWeights.normal,
              //         )))
            ]),
        body: SingleChildScrollView(
          child: GetBuilder<SettingsController>(
              init: SettingsController(),
              builder: (sController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.height(10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingMedium,
                          vertical: AppDimensions.paddingSmall),
                      child: CommonText(
                        text: l10n.settingsHelp.toString().toUpperCase(),
                        fontSize: AppDimensions.fontSmall,
                        color: AppTheme().getSubFontColor(context),
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                    Spacing.height(3),
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5.r),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.1),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingSmall - 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          settingRow(
                            context,
                            Icons.location_on,
                            l10n.changeState,
                            settingsController.selectedState.value,
                            onTap: () {
                              settingsController.clearList();
                              showDialog(
                                context: context,
                                builder: (_) => StateSelectionDialog(),
                              );
                            },
                          ),
                          dividerLine(context),
                          Obx(() => settingRow(
                                context,
                                Icons.language,
                                l10n.changeLanguage,
                                (controller.selectedLanguage.value?.name ??
                                        l10n.selectLanguage)
                                    .capitalizeFirstLetter(),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return LanguageSelectionDialog(
                                        languages: sController.languageList,
                                        title: l10n.selectLanguage,
                                        onLanguageSelected: (lang) {
                                          controller.setSelectedLanguage(lang);
                                        },
                                      );
                                    },
                                  );
                                },
                              )),
                          dividerLine(context),
                          settingRow(
                            context,
                            Icons.dark_mode,
                            l10n.darkMode,
                            themeController.isDarkMode.value ? l10n.on:l10n.off,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => DarkModeDialog(
                                    themeController: themeController),
                              );
                            },
                          ),
                          dividerLine(context),
                          settingRow(context, Icons.email, l10n.contactUs, "",
                              showArrow: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.paddingMedium,
                          vertical: AppDimensions.paddingSmall),
                      child: CommonText(
                        text: "Other".toUpperCase(),
                        fontSize: AppDimensions.fontSmall,
                        color: AppTheme().getSubFontColor(context),
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                    Spacing.height(3),
                    Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5.r),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.1),
                            blurRadius: 8.r,
                            offset: Offset(0, 2.5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimensions.paddingSmall - 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          settingRow(context, Icons.share, l10n.shareApp, "",
                              showArrow: false,onTap: () {
                              settingsController.shareContent('Check out this cool app!', subject: 'Awesome App');

                            },),
                          dividerLine(context),
                          settingRow(context, Icons.star, l10n.rateApp, "",
                              showArrow: false),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget settingRow(
    BuildContext context,
    IconData icon,
    String title,
    String trailingText, {
    bool showArrow = true,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.paddingMedium),
        child: Row(
          children: [
            Icon(icon, size: 24.sp),
            SizedBox(width: 16),
            Expanded(
              child: CommonText(
                text: title,
                fontSize: AppDimensions.fontXMedium,
                color: AppTheme().getFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
            ),
            if (trailingText.isNotEmpty)
              CommonText(
                text: trailingText,
                fontSize: AppDimensions.fontMedium,
                color: AppTheme().getSubFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
            if (showArrow)
              Icon(Icons.arrow_drop_down,
                  color: AppTheme().getSubFontColor(context)),
          ],
        ),
      ),
    );
  }

  Widget dividerLine(BuildContext context) {
    return Container(
      height: 1,
      color: AppTheme().getSubFontColor(context),
    );
  }
}
