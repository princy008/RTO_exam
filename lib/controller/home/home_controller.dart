import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rto_exam/data/app_data.dart';
import 'package:rto_exam/model/question_data.dart';
import 'package:rto_exam/model/sign_data.dart';
import 'package:rto_exam/screens/exam/exam_screen.dart';
import 'package:rto_exam/screens/settings/settings_screen.dart';
import '../../data/language_data.dart';
import '../../data/state_data.dart';
import '../../generated/l10n.dart';
import '../../model/menu_model.dart';
import '../../screens/practice/practice_screen.dart';
import '../../screens/question_bank/question_bank_screen.dart';
import '../../utils/colors.dart';

class HomeController extends GetxController {
  getMenuItem(BuildContext context) {
    final l10n = S.of(context);

    final List<HomeCardModel> menuItems = [
      HomeCardModel(
        title: l10n.questionBank,
        subtitle: l10n.listOfQuestions,
        icon: Icons.menu_book,
        color: AppColors.questionBankBlue,
        onTap: () {
          Get.to(() => QuestionBankScreen());
        },
      ),
      HomeCardModel(
        title: l10n.practiceTest,
        subtitle: l10n.testYourKnowledge,
        icon: Icons.psychology,
        color: AppColors.practiceTestOrange,
        onTap: () {
          Get.to(() => PracticeScreen());
        },
      ),
      HomeCardModel(
        title: l10n.exam,
        subtitle: l10n.attemptATimedRTO,
        icon: Icons.assignment,
        color: AppColors.examBlue,
        onTap: () {
          Get.to(() => ExamScreen());
        },
      ),
      // HomeCardModel(
      //   title: l10n.drivingSchools,
      //   subtitle: l10n.searchForDrivingSchools,
      //   icon: Icons.location_on,
      //   color: AppColors.drivingSchoolTeal,  onTap: () {
      // },
      // ),
      HomeCardModel(
        title: l10n.settingsHelp,
        subtitle: l10n.listOfQuestions,
        icon: Icons.settings,
        color: AppColors.settingsGrey,
        onTap: () {
          Get.to(() => SettingsScreen());
        },
      ),
    ];
    return menuItems;
  }

  RxBool isLoading = false.obs;

  generateData() async {
    isLoading.value = true;
    await AppData().generateData();
    isLoading.value = false;
  }
}
