import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/screens/home/home_screen.dart';
import 'package:rto_exam/screens/language/language_selection_screen.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import '../../controller/language/language_selection_controller.dart';
import '../../data/language_data.dart';
import '../../data/state_data.dart';
import '../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LanguageController controller = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async{
      print("controller.loadFirsTime()===${controller.selectedLanguage()}");
      if(controller.loadFirsTime()){
        controller.isSelectLanguage.value = true;
        controller.update();
      }else{
        Get.to(HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GetBuilder<LanguageController>(
        builder: (controller) {
          return Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200.w,
              height: 200.h,
            ),
            CommonText(
              text: l10n.welcomeTORTOExam,
              fontSize: AppDimensions.fontXLarge,
              color: AppTheme().getFontColor(context),
              fontWeight: AppFontWeights.bold,
            ),
            Spacing.height(10),
          controller.loadFirsTime()?  CommonText(
              text: l10n.pleaseSelectStateLanguage,
              fontSize: AppDimensions.fontMedium,
              color: AppTheme().getFontColor(context),
              fontWeight: AppFontWeights.normal,
            ):CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme().getFontColor(context),
            ),
          ),
            Spacing.height(30),
                controller.loadFirsTime()? controller.isSelectLanguage.value
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                color: AppTheme().getFontColor(context),
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
                          // CommonText(
                          //   text: l10n.selectLanguage,
                          //   fontSize: AppDimensions.fontMedium,
                          //   color: AppColors.blueLightGray,
                          //   fontWeight: AppFontWeights.bold,
                          // ),
                          // Spacing.height(10),
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
                                    color: AppTheme().getFontColor(context),
                                    fontWeight: AppFontWeights.semiBold,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.setSelectedLanguage(value,fromSplash: true);
                              },
                            ),
                          ),
                          Spacing.height(40),
                        ],
                      );
                    }),
                    // Obx(() {
                    //   final enabled =
                    //       controller.selectedState.value != null &&
                    //           controller.selectedLanguage.value != null;
                    //   return SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       onPressed: enabled
                    //           ? () {
                    //               Get.to(HomeScreen());
                    //             }
                    //           : null,
                    //       style: ElevatedButton.styleFrom(
                    //         padding: EdgeInsets.symmetric(
                    //             vertical: AppDimensions.paddingMedium),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8.r),
                    //         ),
                    //         backgroundColor: enabled
                    //             ? Theme.of(context).primaryColor
                    //             : AppColors.blueGrey,
                    //       ),
                    //       child: CommonText(
                    //         text: l10n.continueGO,
                    //         fontSize: AppDimensions.fontXMedium,
                    //         color: Theme.of(context).scaffoldBackgroundColor,
                    //         fontWeight: AppFontWeights.bold,
                    //       ),
                    //     ),
                    //   );
                    // }),
                  ],
                ).paddingSymmetric(horizontal: AppDimensions.paddingXMedium)
                    : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme().getFontColor(context),
                  ),
                ):SizedBox()
          ]));
        }
      ),
    );
  }
}
