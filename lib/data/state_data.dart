class StateData {
  final String state;
  final List<String> languageCodes;

  StateData({
    required this.state,
    required this.languageCodes,
  });

  factory StateData.fromMap(String state, List<String> codes) {
    return StateData(
      state: state,
      languageCodes: codes,
    );
  }
}

final Map<String, List<String>> stateLanguageMapWithCodes = {
  'Andaman and Nicobar Islands': ['en', 'hi'],
  'Andhra Pradesh': ['te', 'en', 'hi'],
  'Arunachal Pradesh': ['en', 'hi'],
  'Assam': ['hi', 'en'],
  'Bihar': ['hi', 'en'],
  'Chandigarh': ['hi', 'en'],
  'Chhattisgarh': ['hi', 'en'],
  'Dadra and Nagar Haveli': ['gu', 'hi', 'en'],
  'Daman and Diu': ['gu', 'hi', 'en'],
  'Delhi': ['hi', 'en'],
  'Goa': ['en', 'hi'],
  'Gujarat': ['gu', 'hi', 'en'],
  'Haryana': ['hi', 'en'],
  'Himachal Pradesh': ['hi', 'en'],
  'Jammu and Kashmir': ['hi', 'en'],
  'Jharkhand': ['hi', 'en'],
  'Karnataka': ['kn', 'en'],
  'Kerala': ['ml', 'en'],
  'Lakshadweep': ['ml', 'hi', 'en'],
  'Madhya Pradesh': ['hi', 'en'],
  'Maharashtra': ['mr', 'hi', 'en'],
  'Manipur': ['hi', 'en'],
  'Meghalaya': ['en', 'hi'],
  'Mizoram': ['hi', 'en'],
  'Nagaland': ['en', 'hi'],
  'Odisha': ['or', 'en'],
  'Puducherry': ['ta', 'en'],
  'Punjab': ['pa', 'hi', 'en'],
  'Rajasthan': ['hi', 'en'],
  'Sikkim': ['hi', 'en'],
  'Tamil Nadu': ['ta', 'en'],
  'Telangana': ['te', 'en', 'hi'],
  'Tripura': ['hi', 'en'],
  'Uttar Pradesh': ['hi', 'en'],
  'Uttarakhand': ['hi', 'en'],
  'West Bengal': ['bn', 'en'],
};


final List<StateData> stateLanguageList = stateLanguageMapWithCodes.entries
    .map((entry) => StateData.fromMap(entry.key, entry.value))
    .toList();
