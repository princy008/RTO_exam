import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rto_exam/model/question_data.dart';
import 'package:rto_exam/model/sign_data.dart';
import '../../data/app_data.dart';
import '../../data/language_data.dart';
import '../../data/state_data.dart';

class LanguageController extends GetxController {
  var selectedState = RxnString();
  var selectedLanguage = Rxn<LanguageData>();

  final _box = GetStorage();
  static const _languageKey = 'selected_language';
  static const _stateKey = 'selected_state';

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  List<LanguageData> get languagesForState {
    if (selectedState.value == null) return [];
    return getLanguagesForState(selectedState.value!);
  }

  List<LanguageData> getLanguagesForState(String state) {
    final stateLang = stateLanguageList.firstWhere(
      (element) => element.state.toLowerCase() == state.toLowerCase(),
      orElse: () => StateData(state: state, languageCodes: []),
    );

    return allLanguages
        .where(
          (lang) => stateLang.languageCodes.contains(lang.code.toLowerCase()),
        )
        .toList();
  }

  void setSelectedState(String? state) async{
    selectedState.value = state;
    selectedLanguage.value = null;
    await AppData().clearBookmarkList();
  }

  void setSelectedLanguage(LanguageData? lang) {
    selectedLanguage.value = lang;

    if (lang != null) {
      _box.write(_languageKey, lang.code);
      Get.updateLocale(Locale(lang.code));
      print('Language changed to: ${lang.code}');
    } else {
      _box.remove(_languageKey);
    }
  }

  void _loadSavedLanguage() {
    final savedState = _box.read(_stateKey);
    if (savedState != null) {
      selectedState.value = savedState;
    }

    final savedCode = _box.read(_languageKey);
    if (savedCode != null) {
      final savedLang = allLanguages.firstWhereOrNull(
        (lang) => lang.code.toLowerCase() == savedCode.toLowerCase(),
      );
      if (savedLang != null) {
        selectedLanguage.value = savedLang;
        Get.updateLocale(Locale(savedLang.code));
      }
    }
  }

  void changeLanguage(String languageCode) {
    final lang = allLanguages.firstWhereOrNull(
      (lang) => lang.code.toLowerCase() == languageCode.toLowerCase(),
    );
    if (lang != null) {
      setSelectedLanguage(lang);
    }
  }
}
