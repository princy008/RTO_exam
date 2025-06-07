import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/data/score_data.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import '../../generated/l10n.dart';
import '../../model/question_data.dart';

class ExamController extends GetxController {
  RxInt index = 0.obs;
  RxInt selectedAnswerIndex = (-1).obs;
  RxBool answerChecked = false.obs;
  RxBool isLoading = true.obs;
  RxBool isStartExam = false.obs;
  RxInt rightAnswer = 0.obs;
  RxInt wrongAnswer = 0.obs;

  var bookMarkList = <int>[].obs;
  Timer? _timer;
  int start = 50;

  void startTimer() {
    start = 50;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
      } else {
        timer.cancel();
        nextQuestion();
      }
      update();
    });
  }

  var questionList = <QuestionData>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  startExam(){
    isStartExam.value = true;
    loadAllData();
    update();
  }

  loadAllData({fromType = false}) async {
    isLoading.value = true;
    index.value = 0;
    selectedAnswerIndex.value = -1;

    await loadBookmarkedQuestions();
    questionList.value = await AppData().loadPracticeList(fromType: fromType);
    questionList.value = questionList.take(15).toList();

    isLoading.value = false;
    startTimer();
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
      startTimer();
    } else {
      back();
    }
    selectedAnswerIndex.value = -1;
    answerChecked.value = false;
    update();
  }

  void previousQuestion() {
    if (index.value > 0) {
      index.value--;
    }
    selectedAnswerIndex.value = -1;
    update();
  }



  void toggleBookmark(int id) async {
    await AppData().toggleBookMark(id);
    await loadBookmarkedQuestions();
    update();
  }

  void selectAnswer(int selectedIndex) async {
    selectedAnswerIndex.value = selectedIndex;
    answerChecked.value = true;
    QuestionData questionData = questionList[index.value];
    questionData.userAnswer = selectedIndex;
    if ((questionData.userAnswer ?? 0) == questionData.correctAnswer) {
      rightAnswer = rightAnswer + 1;
    } else {
      wrongAnswer = wrongAnswer + 1;
    }
    update();
  }

  openStopDialog(BuildContext context){
    final l10n = S.of(context);

    if(isStartExam.value){
      return showDialog(
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
                    text: l10n.stopExam,
                    fontSize: AppDimensions.fontXMedium +2,
                    color:AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.medium,
                  ),
                  Spacing.height(12),
                  CommonText(
                    text: l10n.areYouSureYouWant,
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
                            back();
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
    }else{
      Get.back();
    }



  }

  void back() async{
    if (_timer != null) {
      _timer!.cancel();
    }
    await ScoreData().saveExamList(questionList);
    Get.back();
  }
}
