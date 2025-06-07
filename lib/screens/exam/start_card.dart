import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_button_widget.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import 'package:smooth_corner/smooth_corner.dart';

class StartCard extends StatelessWidget {
  final Function onStartCallBack;

  const StartCard({
    super.key,
    required this.onStartCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Padding(
      padding:EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall,vertical: AppDimensions.paddingMedium+2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 8.r,
              offset: Offset(0, 2.5),
            ),
          ],
        ),
        padding: AppDimensions.paddingAllMedium,
        child: SmoothContainer(
          smoothness: 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: l10n.instructions,
                fontSize: AppDimensions.fontXLarge,
                color: AppTheme().getFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
              Spacing.height(16),
              CommonText(
                text: "• ${l10n.subjectLikeRulesAndRegulations}",
                fontSize: AppDimensions.fontXMedium,
                color: AppTheme().getSubFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
              Spacing.height(20),
              CommonText(
                text:"• 15  ${l10n.questionsAreAskedInTheTest}",
                fontSize: AppDimensions.fontXMedium,
                color: AppTheme().getSubFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
              Spacing.height(20),
              CommonText(
                text:"• 48 ${l10n.secondsAreAllowedToAnswer}",
                fontSize: AppDimensions.fontXMedium,
                color: AppTheme().getSubFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
              Spacing.height(20),
              CommonButton(
                text: l10n.startExam,
                height: 50.h,
                width: double.infinity,
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.backGroundColor,
                borderRadius: 4.r,
                // width: 75.w,
                // borderColor: AppColors.lightGray,
                onPressed: () => onStartCallBack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
