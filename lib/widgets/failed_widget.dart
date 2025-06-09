import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/screens/score/score_card_screen.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_button_widget.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/constant_widget.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import 'package:smooth_corner/smooth_corner.dart';

class FailedWidget extends StatelessWidget {
  final bool isFailed;
  const FailedWidget({super.key, required this.isFailed});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: AppTheme().getQuizBackgroundColor(context),
      appBar: CommonAppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: l10n.RTOExam,
        textColor: AppColors.backGroundColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.backGroundColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacing.height(30),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium - 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    blurRadius: 8.r,
                    offset: Offset(0, 2.5),
                  ),
                ],
              ),
              child: SmoothContainer(
                smoothness: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacing.height(35),
                    getAssetImage(
                      "trophy.png",
                      height: 120.h,
                      width: 120.w,
                    ),
                    Spacing.height(20),
                    CommonText(
                      text: isFailed ? l10n.failed : l10n.congratulations,
                      fontSize: AppDimensions.fontLarge,
                      color: AppTheme().getFontColor(context),
                      fontWeight: AppFontWeights.extraBold,
                    ),
                    Spacing.height(5),
                    CommonText(
                      text: isFailed
                          ? l10n.sorryYouHaveFailedTheDriving
                          : l10n.youHaveSuccessfullyPassed,
                      fontSize: AppDimensions.fontMedium - 1,
                      color: AppTheme().getFontColor(context),
                      fontWeight: AppFontWeights.normal,
                      textAlign: TextAlign.center,
                    ),
                    Spacing.height(15),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.fontSmall - 2,
          horizontal: AppDimensions.fontSmall,
        ),
        child:Row(
          children: [
            Expanded(
              child: CommonButton(
                text: l10n.home,
                height: 45.h,
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.backGroundColor,
                fontSize: AppDimensions.fontSmall + 2,
                borderRadius: 10.r,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Spacing.width(25),
            Expanded(
              child: Expanded(
                child: CommonButton(
                  text: l10n.scorecard,
                  height: 45.h,
                  fontSize: AppDimensions.fontSmall + 2,
                  backgroundColor: AppColors.primaryBlue,
                  textColor: AppColors.backGroundColor,
                  borderRadius: 10.r,
                  onPressed: () {
                    Get.replace(ScoreCardScreen());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
