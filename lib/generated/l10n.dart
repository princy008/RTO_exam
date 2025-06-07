// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `RTO Exam : TraffIQ`
  String get appTitle {
    return Intl.message(
      'RTO Exam : TraffIQ',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Question Bank`
  String get questionBank {
    return Intl.message(
      'Question Bank',
      name: 'questionBank',
      desc: '',
      args: [],
    );
  }

  /// `List of questions and answers and meaning of road signs`
  String get listOfQuestions {
    return Intl.message(
      'List of questions and answers and meaning of road signs',
      name: 'listOfQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Practice Test`
  String get practiceTest {
    return Intl.message(
      'Practice Test',
      name: 'practiceTest',
      desc: '',
      args: [],
    );
  }

  /// `Test your knowledge without worrying about time`
  String get testYourKnowledge {
    return Intl.message(
      'Test your knowledge without worrying about time',
      name: 'testYourKnowledge',
      desc: '',
      args: [],
    );
  }

  /// `Exam`
  String get exam {
    return Intl.message('Exam', name: 'exam', desc: '', args: []);
  }

  /// `Attempt a timed RTO exam`
  String get attemptATimedRTO {
    return Intl.message(
      'Attempt a timed RTO exam',
      name: 'attemptATimedRTO',
      desc: '',
      args: [],
    );
  }

  /// `Driving Schools`
  String get drivingSchools {
    return Intl.message(
      'Driving Schools',
      name: 'drivingSchools',
      desc: '',
      args: [],
    );
  }

  /// `Search for driving schools near you`
  String get searchForDrivingSchools {
    return Intl.message(
      'Search for driving schools near you',
      name: 'searchForDrivingSchools',
      desc: '',
      args: [],
    );
  }

  /// `Settings & Help`
  String get settingsHelp {
    return Intl.message(
      'Settings & Help',
      name: 'settingsHelp',
      desc: '',
      args: [],
    );
  }

  /// `Share & App`
  String get shareAndApp {
    return Intl.message('Share & App', name: 'shareAndApp', desc: '', args: []);
  }

  /// `License application and office details`
  String get LicenseApplicationOffice {
    return Intl.message(
      'License application and office details',
      name: 'LicenseApplicationOffice',
      desc: '',
      args: [],
    );
  }

  /// `Powered by Sakal Media - RTO INDIA`
  String get poweredBy {
    return Intl.message(
      'Powered by Sakal Media - RTO INDIA',
      name: 'poweredBy',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to RTO Exam`
  String get welcomeTORTOExam {
    return Intl.message(
      'Welcome to RTO Exam',
      name: 'welcomeTORTOExam',
      desc: '',
      args: [],
    );
  }

  /// `Please select state and language`
  String get pleaseSelectStateLanguage {
    return Intl.message(
      'Please select state and language',
      name: 'pleaseSelectStateLanguage',
      desc: '',
      args: [],
    );
  }

  /// `open area, all-versing it`
  String get openAreaAllVersingIt {
    return Intl.message(
      'open area, all-versing it',
      name: 'openAreaAllVersingIt',
      desc: '',
      args: [],
    );
  }

  /// `Select State`
  String get selectState {
    return Intl.message(
      'Select State',
      name: 'selectState',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueGO {
    return Intl.message('Continue', name: 'continueGO', desc: '', args: []);
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `Traffic Signs`
  String get trafficSigns {
    return Intl.message(
      'Traffic Signs',
      name: 'trafficSigns',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message('Answer', name: 'answer', desc: '', args: []);
  }

  /// `Practice`
  String get practice {
    return Intl.message('Practice', name: 'practice', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Bookmarks`
  String get bookmarks {
    return Intl.message('Bookmarks', name: 'bookmarks', desc: '', args: []);
  }

  /// `This sign represents...`
  String get thisSignRepresents {
    return Intl.message(
      'This sign represents...',
      name: 'thisSignRepresents',
      desc: '',
      args: [],
    );
  }

  /// `bookmark_list`
  String get bookmarkList {
    return Intl.message(
      'bookmark_list',
      name: 'bookmarkList',
      desc: '',
      args: [],
    );
  }

  /// `practice_data`
  String get practiceData {
    return Intl.message(
      'practice_data',
      name: 'practiceData',
      desc: '',
      args: [],
    );
  }

  /// `selected_language`
  String get selectedLanguage {
    return Intl.message(
      'selected_language',
      name: 'selectedLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Continue from where you left?`
  String get continueFromWhereYouLeft {
    return Intl.message(
      'Continue from where you left?',
      name: 'continueFromWhereYouLeft',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message('NO', name: 'no', desc: '', args: []);
  }

  /// `YES`
  String get yes {
    return Intl.message('YES', name: 'yes', desc: '', args: []);
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `v3.43 (101)`
  String get getVersion {
    return Intl.message('v3.43 (101)', name: 'getVersion', desc: '', args: []);
  }

  /// `Subject like Rules and Regulations of traffic, and traffic signages are included in the test.`
  String get subjectLikeRulesAndRegulations {
    return Intl.message(
      'Subject like Rules and Regulations of traffic, and traffic signages are included in the test.',
      name: 'subjectLikeRulesAndRegulations',
      desc: '',
      args: [],
    );
  }

  /// `questions are asked in the test at random. Out of these, 11 questions must be answered correctly to pass the test.`
  String get questionsAreAskedInTheTest {
    return Intl.message(
      'questions are asked in the test at random. Out of these, 11 questions must be answered correctly to pass the test.',
      name: 'questionsAreAskedInTheTest',
      desc: '',
      args: [],
    );
  }

  /// `seconds are allowed to answer each question.`
  String get secondsAreAllowedToAnswer {
    return Intl.message(
      'seconds are allowed to answer each question.',
      name: 'secondsAreAllowedToAnswer',
      desc: '',
      args: [],
    );
  }

  /// `START EXAM`
  String get startExam {
    return Intl.message('START EXAM', name: 'startExam', desc: '', args: []);
  }

  /// `Stop Exam`
  String get stopExam {
    return Intl.message('Stop Exam', name: 'stopExam', desc: '', args: []);
  }

  /// `Change State`
  String get changeState {
    return Intl.message(
      'Change State',
      name: 'changeState',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `On`
  String get on {
    return Intl.message('On', name: 'on', desc: '', args: []);
  }

  /// `Off`
  String get off {
    return Intl.message('Off', name: 'off', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Share App`
  String get shareApp {
    return Intl.message('Share App', name: 'shareApp', desc: '', args: []);
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message('Rate App', name: 'rateApp', desc: '', args: []);
  }

  /// `Search state...`
  String get searchState {
    return Intl.message(
      'Search state...',
      name: 'searchState',
      desc: '',
      args: [],
    );
  }

  /// `No states found`
  String get noStatesFound {
    return Intl.message(
      'No states found',
      name: 'noStatesFound',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get next {
    return Intl.message('NEXT', name: 'next', desc: '', args: []);
  }

  /// `PREVIOUS`
  String get previous {
    return Intl.message('PREVIOUS', name: 'previous', desc: '', args: []);
  }

  /// `Are you sure you want to stop this exam?`
  String get areYouSureYouWant {
    return Intl.message(
      'Are you sure you want to stop this exam?',
      name: 'areYouSureYouWant',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'kn'),
      Locale.fromSubtags(languageCode: 'ml'),
      Locale.fromSubtags(languageCode: 'mr'),
      Locale.fromSubtags(languageCode: 'or'),
      Locale.fromSubtags(languageCode: 'pa'),
      Locale.fromSubtags(languageCode: 'ta'),
      Locale.fromSubtags(languageCode: 'tu'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
