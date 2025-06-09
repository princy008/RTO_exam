import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/language_data.dart';
import '../../data/state_data.dart';

class SettingsController extends GetxController {
  RxString selectedState = "Gujarat".obs;
  RxString filter = "".obs;
  List<LanguageData> languageList=[];
  final _box = GetStorage();
  static const _stateKey = 'selected_state';

  void setSelectedState(String? state) {
    if (state != null) {
      selectedState.value = state;
      _box.write(_stateKey,state);
      languageList = languagesForState;
      update();
    }
  }
  @override
  void onInit() {
    super.onInit();
    languageList = languagesForState;
    selectedState.value = _box.read(_stateKey)??"";
    update();
  }

  List<LanguageData> get languagesForState {
    return getLanguagesForState(selectedState.value);
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

  List<StateData> filteredStates = stateLanguageList;

  clearList() {
    filteredStates = stateLanguageList;
    filter.value = "";
    update();
  }

  filterList() {
    filteredStates = stateLanguageList.where((stateLang) {
      final stateName = stateLang.state.toLowerCase();
      return stateName.contains(filter.toLowerCase());
    }).toList();

    update();
  }

  void shareContent(String content, {String? subject}) {
    Share.share(content, subject: subject);
  }
  // shareContent('Check out this cool app!', subject: 'Awesome App');

  Future<void> rateApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: '123456789',
        microsoftStoreId: 'your_app_id_here',
      );
    }
  }

}
