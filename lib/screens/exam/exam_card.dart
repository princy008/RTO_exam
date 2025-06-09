import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ExamCard extends StatelessWidget {
  final String question;
  final String imagePath;
  final List<String> options;
  final VoidCallback onBookmarkTap;
  final bool isBookmarked;
  final bool fromSigned;
  final bool isOptionSign;
  final int selectedAnswerIndex;
  final bool answerChecked;
  final int correctAnswerIndex;
  final Function(int) onOptionSelected;

  const ExamCard({
    super.key,
    required this.question,
    required this.imagePath,
    required this.options,
    required this.onBookmarkTap,
    required this.fromSigned,
    this.isBookmarked = false,
    required this.selectedAnswerIndex,
    required this.answerChecked,
    required this.isOptionSign,
    required this.correctAnswerIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        // color: Theme.of(context).b,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Theme.of(context).cardColor,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium,
                      vertical: AppDimensions.paddingLarge,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CommonText(
                            text: "Q. $question",
                            fontSize: AppDimensions.fontXMedium + 1,
                            color: AppTheme().getFontColor(context),
                            fontWeight: AppFontWeights.medium,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Spacing.width(20),
                        GestureDetector(
                          onTap: onBookmarkTap,
                          child: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: isBookmarked
                                ? Theme.of(context).primaryColor
                                : AppTheme().getSubFontColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                  imagePath.isEmpty
                      ? SizedBox()
                      : Container(
                    margin: EdgeInsets.only(bottom: 16.h, top: 12.h),
                    color: AppColors.backGroundColor,
                    child: Image.asset(
                      'assets/icons/$imagePath',
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 1.h, ),

            for (int i = 0; i < options.length; i++) ...[
              fromSigned && isOptionSign
                  ? _buildOptionIcons("${i + 1}", options[i], context,i)
                  : _buildOptionTile("${i + 1}", options[i], context, i),
              if (i != options.length - 1)
                SizedBox(height: 1.h),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptionIcons(String index, String text, BuildContext context, int i) {
    Color bgColor = Theme.of(context).cardColor;
    Color circleColor = Theme.of(context).cardColor;
    Color borderColor = AppTheme().getSubFontColor(context);
    Color indexTextColor = AppTheme().getFontColor(context);

    if (answerChecked) {
      bool isSelected = i == selectedAnswerIndex;
      bool isCorrect = i == correctAnswerIndex;

      if (isSelected) {
        bgColor = AppTheme().getSelectedAnswerColor(context);
        borderColor = AppColors.blackColor;
        indexTextColor = AppColors.blackColor;
        circleColor = Colors.transparent;
      }

    }

    return InkWell(
      onTap: () {
        if (!answerChecked) {
          onOptionSelected(i);
        }
      },
      child: Container(
        color: bgColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingMedium,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 28.r,
              height: 28.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 0.8,
                ),
              ),
              child: CommonText(
                text: index,
                fontSize: AppDimensions.fontMedium,
                color: indexTextColor,
                fontWeight: AppFontWeights.normal,
              ),
            ),
            Spacing.width(12),
            Container(
              color: Colors.white, // No background box behind image
              child: Image.asset(
                'assets/icons/$text',
                width: 75.w,
                height: 75.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildOptionTile(String index, String text, BuildContext context, int i) {
    // Default colors from theme
    Color bgColor = Theme.of(context).cardColor;
    Color circleColor = Theme.of(context).cardColor;
    Color borderColor = AppTheme().getSubFontColor(context);
    Color textColor = AppTheme().getSubFontColor(context);
    Color indexTextColor = AppTheme().getFontColor(context);

    if (answerChecked) {
      bool isSelected = i == selectedAnswerIndex;

      if (isSelected) {
        bgColor = AppTheme().getSelectedAnswerColor(context);
        borderColor = AppColors.blackColor;
        textColor = AppColors.blackColor;
        indexTextColor = AppColors.blackColor;
        circleColor = Colors.transparent;
      }


    }

    return InkWell(
      onTap: () {
        if (!answerChecked) {
          onOptionSelected(i);
        }
      },
      child: Container(
        color: bgColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.paddingXMedium,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 28.r,
              height: 28.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 0.8,
                ),
              ),
              child: CommonText(
                text: index,
                fontSize: AppDimensions.fontMedium,
                color: indexTextColor,
                fontWeight: AppFontWeights.medium,
              ),
            ),
            Spacing.width(12),
            Expanded(
              child: CommonText(
                text: text,
                fontSize: AppDimensions.fontXMedium + 1,
                color: textColor,
                fontWeight: AppFontWeights.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
