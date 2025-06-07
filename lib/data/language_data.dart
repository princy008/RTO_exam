class LanguageData {
  final String code;
  final String name;
  final String display;

  LanguageData({
    required this.code,
    required this.name,
    required this.display,
  });

  factory LanguageData.fromMap(Map<String, String> map) {
    return LanguageData(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      display: map['display'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'code': code,
      'name': name,
      'display': display,
    };
  }
}

final List<Map<String, String>> allLanguagesMap = [
  {'code': 'en', 'name': 'english', 'display': 'English'},
  {'code': 'hi', 'name': 'hindi', 'display': 'हिन्दी'},
  {'code': 'te', 'name': 'telugu', 'display': 'తెలుగు'},
  {'code': 'gu', 'name': 'gujarati', 'display': 'ગુજરાતી'},
  {'code': 'kn', 'name': 'kannada', 'display': 'ಕನ್ನಡ'},
  {'code': 'ml', 'name': 'malayalam', 'display': 'മലയാളം'},
  {'code': 'mr', 'name': 'marathi', 'display': 'मराठी'},
  {'code': 'or', 'name': 'odia', 'display': 'ଓଡ଼ିଆ'},
  {'code': 'ta', 'name': 'tamil', 'display': 'தமிழ்'},
  {'code': 'pa', 'name': 'punjabi', 'display': 'ਪੰਜਾਬੀ'},
  {'code': 'bn', 'name': 'bengali', 'display': 'বাংলা'},
];

final List<LanguageData> allLanguages = allLanguagesMap.map((e) => LanguageData.fromMap(e)).toList();
