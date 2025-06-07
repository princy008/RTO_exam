import 'package:get/get.dart';

import '../../data/state_data.dart';

class SettingsController extends GetxController {
  RxString selectedState = "Gujarat".obs;
  RxString filter = "".obs;

  void setSelectedState(String? state) {
    if (state != null) {
      selectedState.value = state;
      update();
    }
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
}
