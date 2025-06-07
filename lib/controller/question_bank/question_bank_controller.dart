import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/model/question_data.dart';
import 'package:rto_exam/theme/app_theme.dart';

import '../../model/sign_data.dart';

class QuestionBankController extends GetxController {
  final LanguageController languageController = Get.find<LanguageController>();
  final GetStorage storage = GetStorage();
  RxInt selectedIndex = 0.obs;

  var questions = <QuestionData>[].obs;

  // var signQuestions = <QuestionData>[].obs;
  var bookMarkList = <int>[].obs;

  Future<void> loadQuestions() async {
    questions.value = await AppData().getQuestionBankList();
  }

  Future<void> loadSignQuestions() async {
    questions.value = await AppData().getSignList();
  }

  var selectedFilter = 'All'.obs;
  final String bookmarkKey = 'bookmarked_questions';

  @override
  void onInit() {
    super.onInit();
    loadBookmarkedQuestions();
  }

  bool isBookmarked(int id) {
    return bookMarkList.contains(id);
  }

  List<QuestionData> get filteredQuestions {
    if (selectedFilter.value == 'Bookmarks') {
      return questions.where((q) => isBookmarked(q.id ?? 0)).toList();
    } else {
      return questions;
    }
  }

  void loadBookmarkedQuestions() async {
    bookMarkList.value = await AppData().getBookMarkList();
  }

  void selectTab(int i) async {
    if (i != selectedIndex.value) {
      selectedIndex.value = i;

      if (selectedIndex.value == 0) {
        loadQuestions();
      } else {
        loadSignQuestions();
      }
    }
    update();
  }

  void toggleBookmark(int id) async {
    await AppData().toggleBookMark(id);
    loadBookmarkedQuestions();
    update();
  }
}
