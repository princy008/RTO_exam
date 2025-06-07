import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import 'package:smooth_corner/smooth_corner.dart';

class SignCard extends StatelessWidget {
  final String signIcon;
  final String signTitle;
  final String signIndex;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const SignCard({
    super.key,
    required this.signIcon,
    required this.signTitle,
    required this.signIndex,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.paddingBottomSmall,
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
        child: SmoothContainer(
          smoothness: 0.9,
          color: Theme.of(context).cardColor,
          padding: AppDimensions.paddingAllMedium,
          child: Stack(
            children: [
              Row(
                children: [
                  CommonText(
                    text: signIndex,
                    fontSize: AppDimensions.fontXMedium,
                    color: AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                  Spacing.width(8),
                  Container(
                    color: Colors.white,
                    child: Image.asset(
                      'assets/icons/$signIcon',
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Spacing.width(12),
                  Expanded(
                    child: CommonText(
                        text: signTitle,
                        fontSize: AppDimensions.fontXMedium,
                        color: AppTheme().getFontColor(context),
                        fontWeight: AppFontWeights.semiBold),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onBookmarkToggle,
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked
                        ? Theme.of(context).primaryColor
                        : AppTheme().getSubFontColor(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
