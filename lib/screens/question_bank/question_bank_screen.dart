import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/controller/question_bank/question_bank_controller.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/screens/question_bank/question_card.dart';
import 'package:rto_exam/screens/question_bank/sign_card.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

class QuestionBankScreen extends StatefulWidget {
  const QuestionBankScreen({super.key});

  @override
  State<QuestionBankScreen> createState() => _QuestionBankScreenState();
}

class _QuestionBankScreenState extends State<QuestionBankScreen> {
  final QuestionBankController questionController = Get.put(QuestionBankController());


  @override
  void initState() {
    super.initState();
    questionController.loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return GetBuilder<QuestionBankController>(init: QuestionBankController(),builder: (controller) => Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonAppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: l10n.questionBank,
        textColor: AppColors.backGroundColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color:AppColors.backGroundColor),
        ),
        actions: [
          Obx(() {
            return PopupMenuButton<String>(
              initialValue: questionController.selectedFilter.value,
              onSelected: (value) {
                questionController.selectedFilter.value = value;
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'All',
                  child:  CommonText(
                    text: "All",
                    fontSize: AppDimensions.fontSmall,
                    color: AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
                PopupMenuItem(
                  value: 'Bookmarks',
                  child: CommonText(
                    text: "Bookmarks",
                    fontSize: AppDimensions.fontSmall,
                    color: AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
              ],
              child: Row(
                children: [
                  CommonText(
                    text: questionController.selectedFilter.value,
                    fontSize: AppDimensions.fontSmall,
                    color: AppColors.backGroundColor,
                    fontWeight: AppFontWeights.medium,
                  ),
                  Icon(Icons.arrow_drop_down, color: AppColors.backGroundColor),
                  Spacing.width(12),
                ],
              ),
            );
          }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: AppDimensions.paddingAllMedium,
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: AppTheme().getTabColor(context),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _tabButton(l10n.questions, 0),
                  _tabButton(l10n.trafficSigns, 1),
                ],
              ),
            ),
          ),
          Obx(() {
            final filteredList = questionController.filteredQuestions;
            return  Expanded(
              child: questionController.selectedIndex.value == 0
                  ? ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];
                  return QuestionCard(
                    questionTitle: "${index + 1}. ",
                    question: item.question,
                    answer: item.options[item.correctAnswer],
                    isBookmarked: questionController.isBookmarked(item.id??0),
                    onBookmarkToggle: () {
                      questionController.toggleBookmark(item.id??0);
                    },
                  );
                },
              )
                  : ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];

                  return SignCard(
                    signIcon: "${item.displayIcon}",
                    signTitle: "${item.displaySign}",
                    signIndex:"${index + 1}. ",
                    isBookmarked: questionController.isBookmarked(item.id??0),
                    onBookmarkToggle: () {
                      questionController.toggleBookmark(item.id??0);
                    },
                  );
                },
              ),
            );
          },)
        ],
      ),
    ),);
  }

  Widget _tabButton(String label, int index) {
    bool isSelected = questionController.selectedIndex.value == index;
    return Expanded(
      child: InkWell(
          onTap: () {
            questionController.selectTab(index);
          },
          child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: CommonText(
                  text: label,
                  fontSize: AppDimensions.fontMedium,
                  color: isSelected
                      ? AppColors.backGroundColor
                      : AppTheme().getSubFontColor(context),
                  fontWeight: AppFontWeights.extraBold,
                ),
              ))),
    );
  }
}
