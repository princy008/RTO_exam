import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/model/question_data.dart';
import 'package:rto_exam/screens/exam/exam_card.dart';
import 'package:rto_exam/screens/exam/start_card.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_button_widget.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import '../../controller/exam/exam_controller.dart';

class ExamScreen extends StatelessWidget {
  ExamScreen({super.key});

  final ExamController examController = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return GetBuilder<ExamController>(
      init: ExamController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.openStopDialog(context);
            return true;
          },
          child: Scaffold(
            backgroundColor: AppTheme().getQuizBackgroundColor(context),
            appBar: CommonAppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: l10n.exam,
              textColor: AppColors.backGroundColor,
              leading: InkWell(
                onTap: () => controller.openStopDialog(context),
                child: Icon(Icons.arrow_back, color: AppColors.backGroundColor),
              ),
              actions: controller.isStartExam.value
                  ? [
                      CommonText(
                        text:
                            "${controller.index.value + 1}/${controller.questionList.length}",
                        fontSize: AppDimensions.fontMedium,
                        color: AppColors.backGroundColor,
                        fontWeight: AppFontWeights.normal,
                      ),
                      Spacing.width(12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal : AppDimensions.paddingSmall, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColors.blackColor,
                        size: 18.sp,
                      ),
                      Spacing.width(4.w),
                      CommonText(
                        text: '${controller.start} s',
                        fontSize: AppDimensions.fontSmall,
                        color: AppColors.blackColor,
                        fontWeight: AppFontWeights.medium,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Spacing.width(12),
                    ]
                  : [],
            ),
            body: !controller.isStartExam.value
                ? StartCard(
                    onStartCallBack: () {
                      controller.startExam();
                    },
                  )
                : controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingMedium,
                            horizontal: AppDimensions.paddingXSmall),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Builder(builder: (context) {
                                  QuestionData item = controller
                                      .questionList[controller.index.value];

                                  return ExamCard(
                                    question: item.question,
                                    imagePath: controller.getQuestionSign(),
                                    options: item.options,
                                    isBookmarked:
                                        controller.isBookmarked(item.id ?? 0),
                                    fromSigned: item.fromSign ?? false,
                                    isOptionSign: item.isSignOption,
                                    onBookmarkTap: () {
                                      controller.toggleBookmark(item.id ?? 0);
                                    },
                                    selectedAnswerIndex:
                                        controller.selectedAnswerIndex.value,
                                    answerChecked:
                                        controller.answerChecked.value,
                                    correctAnswerIndex: item.correctAnswer,
                                    onOptionSelected: (index) {
                                      controller.selectAnswer(index);
                                    },
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
            bottomNavigationBar: controller.isStartExam.value
                ? CustomBottomBar(
                    correctCount: controller.wrongAnswer.value,
                    incorrectCount: controller.rightAnswer.value,
                    currentIndex: controller.index.value,
                    onNextPressed: () => controller.nextQuestion(),
                    onPreviousPressed: () => controller.previousQuestion(),
                  )
                : SizedBox(),
          ),
        );
      },
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int correctCount;
  final int incorrectCount;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final int currentIndex;

  const CustomBottomBar({
    super.key,
    required this.correctCount,
    required this.incorrectCount,
    required this.onNextPressed,
    required this.onPreviousPressed,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 6.h,
      ),
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Spacing.width(10),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium - 4,
              vertical: AppDimensions.paddingSmall - 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: LinearGradient(
                colors: [AppColors.correctColor, AppColors.incorrectColor],
                stops: [0.5, 0.5],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.check,
                        size: 16.r, color: AppColors.backGroundColor),
                    Spacing.width(4),
                    CommonText(
                      text: "$correctCount",
                      fontSize: AppDimensions.fontMedium,
                      color: AppColors.backGroundColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ],
                ),
                Spacing.width(24),
                Row(
                  children: [
                    Icon(Icons.close,
                        size: 16.r, color: AppColors.backGroundColor),
                    Spacing.width(4),
                    CommonText(
                      text: "$incorrectCount",
                      fontSize: AppDimensions.fontMedium,
                      color: AppColors.backGroundColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          CommonButton(
            text: l10n.next,
            height: 40.h,
            backgroundColor: AppColors.primaryBlue,
            textColor: AppColors.backGroundColor,
            borderRadius: 4.r,
            width: 75.w,
            onPressed: onNextPressed,
          ),
          Spacing.width(10),
        ],
      ),
    );
  }
}
