// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:rto_exam/generated/l10n.dart';
// import 'package:rto_exam/theme/app_theme.dart';
// import 'package:rto_exam/utils/colors.dart';
// import 'package:rto_exam/utils/constant.dart';
// import 'package:rto_exam/widgets/common_app_bar.dart';
// import 'package:rto_exam/widgets/common_button_widget.dart';
// import 'package:rto_exam/widgets/common_text.dart';
// import 'package:rto_exam/widgets/spacing_widget.dart';
// import '../../controller/score/score_controller.dart';
//
// class ScoreCardScreen extends StatelessWidget {
//   ScoreCardScreen({super.key});
//
//   final ScoreCardController scoreCardController = Get.put(ScoreCardController());
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = S.of(context);
//
//     return Scaffold(
//       backgroundColor: AppTheme().getQuizBackgroundColor(context),
//       appBar: CommonAppBar(
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         title: l10n.scorecard,
//         textColor: AppColors.backGroundColor,
//         actions: [
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: AppDimensions.paddingSmall - 4,
//               vertical: AppDimensions.paddingSmall - 4,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30.r),
//               gradient: LinearGradient(
//                 colors: [AppColors.correctColor, AppColors.incorrectColor],
//                 stops: [0.5, 0.5],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.check,
//                         size: 16.r, color: AppColors.backGroundColor),
//                     Spacing.width(4),
//                     CommonText(
//                       text: "9",
//                       // text: "$correctCount",
//                       fontSize: AppDimensions.fontMedium,
//                       color: AppColors.backGroundColor,
//                       fontWeight: AppFontWeights.bold,
//                     ),
//                   ],
//                 ),
//                 Spacing.width(20),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.close,
//                       size: 16.r,
//                       color: AppColors.backGroundColor,
//                     ),
//                     Spacing.width(4),
//                     CommonText(
//                       text: "17",
//                       // text: "$incorrectCount",
//                       fontSize: AppDimensions.fontMedium,
//                       color: AppColors.backGroundColor,
//                       fontWeight: AppFontWeights.bold,
//                     ),
//                     Spacing.width(6),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 6),
//         ],
//       ),
//       body: Obx(() => ListView.separated(
//             itemCount: scoreCardController.questions.length,
//             separatorBuilder: (_, __) => Divider(),
//             itemBuilder: (context, index) {
//               final item = scoreCardController.questions[index];
//               return QuestionCard(item: item);
//             },
//           )),
//       bottomNavigationBar: Container(
//         color: Theme.of(context).cardColor,
//         padding: EdgeInsets.symmetric(
//           vertical: AppDimensions.fontSmall - 2,
//           horizontal: AppDimensions.fontSmall,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: CommonButton(
//                 text: l10n.home,
//                 height: 45.h,
//                 icon: Icon(
//                   Icons.home,
//                   size: 20.sp,
//                   color: AppColors.backGroundColor,
//                 ),
//                 backgroundColor: AppColors.primaryBlue,
//                 textColor: AppColors.backGroundColor,
//                 fontSize: AppDimensions.fontSmall + 2,
//                 borderRadius: 4.r,
//                 onPressed: () {},
//               ),
//             ),
//             Spacing.width(10),
//             Expanded(
//               child: Expanded(
//                 child: CommonButton(
//                   text: l10n.tryAgain,
//                   icon: Icon(
//                     Icons.refresh,
//                     size: 20.sp,
//                     color: AppColors.backGroundColor,
//                   ),
//                   height: 45.h,
//                   fontSize: AppDimensions.fontSmall + 2,
//                   backgroundColor: AppColors.primaryBlue,
//                   textColor: AppColors.backGroundColor,
//                   borderRadius: 4.r,
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class QuestionCard extends StatelessWidget {
//   final QuestionItem item;
//
//   const QuestionCard({super.key, required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = S.of(context);
//
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: AppDimensions.paddingMedium,
//         vertical: AppDimensions.paddingSmall,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 24.h,
//             width: 25.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: item.isCorrect
//                     ? AppColors.correctColor
//                     : AppColors.incorrectColor,
//                 width: 1.4.w,
//               ),
//             ),
//             child: Center(
//               child: item.isCorrect
//                   ? Icon(
//                       Icons.check_rounded,
//                       color: AppColors.correctColor,
//                       size: 20.sp,
//                     )
//                   : Icon(
//                       Icons.close,
//                       color: AppColors.incorrectColor,
//                       size: 20.sp,
//                     ),
//             ),
//           ),
//           Spacing.width(12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CommonText(
//                   text: "${l10n.questions[0].toUpperCase()}. ${item.question}",
//                   fontSize: AppDimensions.fontLarge - 2,
//                   color: AppTheme().getFontColor(context),
//                   fontWeight: AppFontWeights.semiBold,
//                 ),
//                 Spacing.height(8),
//                 CommonText(
//                   text: '${l10n.yourAnswer} : ${item.yourAnswer}',
//                   fontSize: AppDimensions.fontMedium + 1,
//                   color: AppTheme().getSubFontColor(context),
//                   fontWeight: AppFontWeights.semiBold,
//                 ),
//                 Spacing.height(6),
//                 if (!item.isCorrect)
//                   CommonText(
//                     text: '${l10n.rightAnswer} : ${item.rightAnswer}',
//                     fontSize: AppDimensions.fontMedium + 1,
//                     color: AppColors.correctColor,
//                     fontWeight: AppFontWeights.semiBold,
//                   ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//                 left: AppDimensions.paddingSmall,
//                 top: AppDimensions.paddingSmall - 2),
//             child: Icon(
//               Icons.bookmark_border,
//               // color: widget.isBookmarked?Theme.of(context).primaryColor:AppTheme().getSubFontColor(context),
//               color: AppTheme().getSubFontColor(context),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/model/question_data.dart';
import 'package:rto_exam/screens/exam/exam_screen.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_button_widget.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import '../../controller/score/score_controller.dart';

class ScoreCardScreen extends StatelessWidget {
  ScoreCardScreen({super.key});

  final ScoreCardController scoreCardController =
  Get.put(ScoreCardController());

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: AppTheme().getQuizBackgroundColor(context),
      appBar: CommonAppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: l10n.scorecard,
        textColor: AppColors.backGroundColor,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingSmall - 4,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check,
                        size: 16.r, color: AppColors.backGroundColor),
                    Spacing.width(4),
                    CommonText(
                      // text: "9",
                      text: "${scoreCardController.correctCount.value}",
                      fontSize: AppDimensions.fontMedium,
                      color: AppColors.backGroundColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ],
                ),
                Spacing.width(20),
                Row(
                  children: [
                    Icon(
                      Icons.close,
                      size: 16.r,
                      color: AppColors.backGroundColor,
                    ),
                    Spacing.width(4),
                    CommonText(
                      text: "${scoreCardController.wrongCount.value}",
                      fontSize: AppDimensions.fontMedium,
                      color: AppColors.backGroundColor,
                      fontWeight: AppFontWeights.bold,
                    ),
                    Spacing.width(6),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Obx(() => ListView.separated(
        itemCount: scoreCardController.questionList.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final item = scoreCardController.questionList[index];
          return QuestionCard(
            item: item,
            scoreCardController: scoreCardController,
          );
        },
      )),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.fontSmall - 2,
          horizontal: AppDimensions.fontSmall,
        ),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                text: l10n.home,
                height: 45.h,
                icon: Icon(
                  Icons.home,
                  size: 20.sp,
                  color: AppColors.backGroundColor,
                ),
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.backGroundColor,
                fontSize: AppDimensions.fontSmall + 2,
                borderRadius: 4.r,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Spacing.width(10),
            Expanded(
              child: CommonButton(
                text: l10n.tryAgain,
                height: 45.h,
                icon: Icon(
                  Icons.refresh,
                  size: 20.sp,
                  color: AppColors.backGroundColor,
                ),
                backgroundColor: AppColors.primaryBlue,
                textColor: AppColors.backGroundColor,
                fontSize: AppDimensions.fontSmall + 2,
                borderRadius: 4.r,
                onPressed: () {
                  Get.replace(ExamScreen());
                  

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final QuestionData item;
  final ScoreCardController scoreCardController;

  const QuestionCard(
      {super.key, required this.item, required this.scoreCardController});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    String imagePath = scoreCardController.getQuestionSign(item);

    bool isCorrect = item.correctAnswer == item.userAnswer;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    Color correctColor = isDarkTheme? AppColors.correctColor:Colors.green;

    print("sd==${item.userAnswer}");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.paddingSmall,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24.h,
            width: 25.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isCorrect
                    ? correctColor
                    : AppColors.incorrectColor,
                width: 1.4.w,
              ),
            ),
            child: Center(
              child: isCorrect
                  ? Icon(
                Icons.check_rounded,
                color: correctColor,
                size: 20.sp,
              )
                  : Icon(
                Icons.close,
                color: AppColors.incorrectColor,
                size: 20.sp,
              ),
            ),
          ),
          Spacing.width(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "${l10n.questions[0].toUpperCase()}. ${item.question}",
                  fontSize: AppDimensions.fontLarge - 2,
                  color: AppTheme().getFontColor(context),
                  fontWeight: AppFontWeights.semiBold,
                ),
                imagePath.isEmpty
                    ? SizedBox()
                    : Container(
                    margin: EdgeInsets.only(bottom: 8.h, top: 5.h),
                    color: AppColors.backGroundColor,
                    child: Image.asset(
                      'assets/icons/$imagePath',
                      width: 75.w,
                      height: 75.h,
                      fit: BoxFit.contain,
                    )),
                Spacing.height(8),
                CommonText(
                  text:
                  '${l10n.yourAnswer} : ${(item.fromSign ?? false) && (item.isSignOption) ? "" : item.options[item.userAnswer ?? 0]}',
                  fontSize: AppDimensions.fontMedium + 1,
                  color: isCorrect
                      ? correctColor
                      : AppTheme().getSubFontColor(context),
                  fontWeight: AppFontWeights.semiBold,
                ),
                (item.fromSign ?? false) && item.isSignOption
                    ? Container(
                  margin: EdgeInsets.only(top: 5.h),

                  color: Colors.white, // No background box behind image
                  child: Image.asset(
                    'assets/icons/${item.options[item.userAnswer ?? 0]}',
                    width: 75.w,
                    height: 75.h,
                    fit: BoxFit.contain,
                  ),
                )
                    : SizedBox(),


                Spacing.height(6),
                !isCorrect
                    ? CommonText(
                  text:
                  '${l10n.rightAnswer} : ${(item.fromSign ?? false) && (item.isSignOption) ? "" : item.options[item.correctAnswer]}',
                  fontSize: AppDimensions.fontMedium + 1,
                  color: correctColor,
                  fontWeight: AppFontWeights.semiBold,
                )
                    : Container(),
                !isCorrect?  (item.fromSign ?? false) && item.isSignOption
                    ? Container(
                  margin: EdgeInsets.only(top: 5.h),
                  color: Colors.white, // No background box behind image
                  child: Image.asset(
                    'assets/icons/${item.options[item.correctAnswer ?? 0]}',
                    width: 75.w,
                    height: 75.h,
                    fit: BoxFit.contain,
                  ),
                )
                    : SizedBox(): SizedBox(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimensions.paddingSmall,
                top: AppDimensions.paddingSmall - 2),
            child: Icon(
              Icons.bookmark_border,
              // color: widget.isBookmarked?Theme.of(context).primaryColor:AppTheme().getSubFontColor(context),
              color: AppTheme().getSubFontColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
