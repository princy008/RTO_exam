import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import '../../generated/l10n.dart';
import '../../model/question_data.dart';

class PracticeController extends GetxController {

  RxString selectedFilter = '0'.obs;
  RxInt index = 0.obs;
  RxInt selectedAnswerIndex = (-1).obs;
  RxBool answerChecked = false.obs;
  RxBool isLoading = true.obs;
  RxInt rightAnswer = 0.obs;
  RxInt wrongAnswer = 0.obs;
  final box = GetStorage();
  final lastIndex = 'last_index';
  final lastSelection = 'last_selection';
  final rightAnswerKey = 'right_answer';
  final wrongAnswerKey = 'wrong_answer';
  RxBool showResumeDialog = true.obs;


  var bookMarkList = <int>[].obs;

  void updateFilter(String value) async {
    selectedFilter.value = value;
    loadAllData(fromType: true);
  }

  var questionList = <QuestionData>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadAllData();
  }

  loadAllData({fromType = false}) async {
    isLoading.value = true;
    index.value = 0;

    await loadBookmarkedQuestions();
    if (selectedFilter.value == "1") {
      questionList.value = await AppData().loadPracticeList(fromType: fromType);
      questionList.value = filteredQuestions;
    } else if (selectedFilter.value == "2") {
      questionList.value = await AppData().getSignList(fromType: fromType);
    } else if (selectedFilter.value == "3") {
      questionList.value =
          await AppData().getQuestionBankList(fromType: fromType);
    } else {
      questionList.value = await AppData().loadPracticeList(fromType: fromType);
    }

    setAnswer();
    isLoading.value = false;
    update();
  }

  void openContinueDialog(BuildContext context) {
    final l10n = S.of(context);

    if ((box.read(lastIndex) ?? 0) > 0) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            backgroundColor: Theme.of(context).cardColor,
            child: Padding(
              padding: AppDimensions.paddingAllXMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: l10n.practice,
                    fontSize: AppDimensions.fontXMedium +2,
                    color:AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                  Spacing.height(12),
                  CommonText(
                    text: l10n.continueFromWhereYouLeft,
                    fontSize: AppDimensions.fontXMedium +2,
                    color:AppTheme().getSubFontColor(context),
                    fontWeight: AppFontWeights.normal,
                  ),
                  Spacing.height(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium, vertical: AppDimensions.paddingSmall),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.subFontColor,width: 0.3),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CommonText(
                            text: l10n.no,
                            fontSize: AppDimensions.fontMedium ,
                            color:AppTheme().getFontColor(context),
                            fontWeight: AppFontWeights.medium,
                          ),
                        ),
                      ),
                      Spacing.width(8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium, vertical: AppDimensions.paddingSmall),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.subFontColor,width: 0.3),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            continueWithLastQuestion();
                          },
                          child:  CommonText(
                            text: l10n.yes,
                            fontSize: AppDimensions.fontMedium,
                            color:AppTheme().getFontColor(context),
                            fontWeight: AppFontWeights.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  continueWithLastQuestion() {
    index.value = box.read(lastIndex) ?? 0;
    rightAnswer.value = box.read(rightAnswerKey) ?? 0;
    wrongAnswer.value = box.read(wrongAnswerKey) ?? 0;
    selectedFilter.value = box.read(lastSelection) ?? "0";
    update();
  }

    List<QuestionData> get filteredQuestions {
      return questionList.where((q) => isBookmarked(q.id ?? 0)).toList();
    }

  bool isBookmarked(int id) {
    return bookMarkList.contains(id);
  }

  String getQuestionSign() {
    QuestionData item = questionList[index.value];

    if (item.fromSign ?? false) {
      return item.sign ?? "";
    } else if (item.isSign) {
      return item.sign ?? "";
    } else {
      return "";
    }
  }

  Future<void> loadBookmarkedQuestions() async {
    bookMarkList.value = await AppData().getBookMarkList();
    update();
  }

  Map<String, dynamic> getMenuList(BuildContext c) {
    final l10n = S.of(c);

    return {
      '0': l10n.all,
      '1': l10n.bookmarks,
      '2': l10n.trafficSigns,
      '3': l10n.questions,
    };
  }

  void nextQuestion() {
    if (index.value < questionList.length - 1) {
      index.value++;
    } else {
      index.value = 0;
    }
    setAnswer();
    update();
  }

  setAnswer() {
    selectedAnswerIndex.value = questionList[index.value].userAnswer ?? -1;
    if (selectedAnswerIndex.value >= 0) {
      answerChecked.value = true;
    } else {
      answerChecked.value = false;
    }
  }

  void previousQuestion() {
    if (index.value > 0) {
      index.value--;
    }

    setAnswer();
    update();
  }

  void toggleBookmark(int id) async {
    await AppData().toggleBookMark(id);
    await loadBookmarkedQuestions();
    update();
  }

  void selectAnswer(int selectedIndex) async {
    QuestionData questionData = questionList[index.value];
    questionList[index.value].userAnswer = selectedIndex;

    await AppData().savePracticeList(questionList);

    selectedAnswerIndex.value = selectedIndex;
    answerChecked.value = true;
    if ((questionData.userAnswer ?? 0) == questionData.correctAnswer) {
      rightAnswer = rightAnswer + 1;
    } else {
      wrongAnswer = wrongAnswer + 1;
    }
    update();
  }

  void back(BuildContext c) {
    box.write(lastIndex, index.value);
    box.write(lastSelection, selectedFilter.value);
    box.write(rightAnswerKey, rightAnswer.value);
    box.write(wrongAnswerKey, wrongAnswer.value);
    Get.back();
  }
}
