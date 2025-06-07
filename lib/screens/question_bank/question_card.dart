import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../utils/constant.dart';
import '../../widgets/common_text.dart';
import '../../widgets/spacing_widget.dart';

class QuestionCard extends StatefulWidget {
  final String questionTitle;
  final String question;
  final String answer;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;


  const QuestionCard({
    super.key,
    required this.questionTitle,
    required this.question,
    required this.answer, required this.isBookmarked, required this.onBookmarkToggle,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonText(
                      text: widget.questionTitle + widget.question,
                      fontSize: AppDimensions.fontXMedium,
                      color: AppTheme().getFontColor(context),
                      fontWeight: AppFontWeights.medium,
                    ),
                  ),
                  GestureDetector(
                    onTap:widget.onBookmarkToggle,
                    child: Icon(
                      widget.isBookmarked? Icons.bookmark : Icons.bookmark_border,
                      color: widget.isBookmarked?Theme.of(context).primaryColor:AppTheme().getSubFontColor(context),
                    ),
                  ),
                ],
              ),
              Spacing.height(8),
              CommonText(
                text: '${l10n.answer.substring(0, 1) ?? ""} : ${widget.answer}',
                fontSize: AppDimensions.fontMedium,
                color: AppTheme().getSubFontColor(context),
                fontWeight: AppFontWeights.normal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
