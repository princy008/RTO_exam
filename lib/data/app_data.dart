import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/question_data.dart';

class AppData {
  Future<void> toggleBookMark(int id) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> stringList = prefs.getStringList('bookmark_list') ?? [];

    List<int> idList = stringList.map((e) => int.parse(e)).toList();

    if (idList.contains(id)) {
      idList.remove(id);
    } else {
      idList.add(id);
    }

    await prefs.setStringList(
      'bookmark_list',
      idList.map((e) => e.toString()).toList(),
    );
  }

  Future<List<int>> getBookMarkList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList('bookmark_list');
    return stringList?.map((e) => int.parse(e)).toList() ?? [];
  }

  Future<void> clearBookmarkList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bookmark_list');
    await prefs.remove('practice_data');
  }

  Future<List<QuestionData>> loadPracticeList({fromType = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? jsonList = prefs.getStringList('practice_data');

    if (jsonList == null) return [];

    return jsonList.map((item) => QuestionData.fromJson(json.decode(item),fromType: fromType)).toList();
  }

  Future<void> savePracticeList(List<QuestionData> persons) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = persons.map((person) => json.encode(person.toJson())).toList();
    await prefs.setStringList('practice_data', jsonList);
  }

  Future<List<QuestionData>> getSignList({fromType=false}) async {
    List<QuestionData> dataList = await loadPracticeList(fromType: fromType);

    List<QuestionData> signQuestions = dataList.where((item) => item.fromSign ?? false).cast<QuestionData>().toList();
    return signQuestions;
  }

  Future<List<QuestionData>> getQuestionBankList({fromType=false}) async {
    List<QuestionData> dataList = await loadPracticeList(fromType: fromType);

    List<QuestionData> list = dataList.where((item) => (!(item.fromSign??false) && !item.isSign)).cast<QuestionData>().toList();

    return list;
  }


  Future<void> generateData() async {
    List<QuestionData> dataList = [];

    if (dataList.isNotEmpty) {
      return ;
    }
    final box = GetStorage();
    String languageCode = box.read('selected_language') ?? 'en';

    final jsonString = await rootBundle.loadString(
      'assets/data/sign/${languageCode}_sign.json',
    );
    final List<dynamic> trafficSigns = json.decode(jsonString);

    int lastId = 0;

    for (int i = 0; i < trafficSigns.length; i++) {
      QuestionData data;
      if (i % 2 == 0) {
        data = await generateImageBasedQuestionFixed(
          trafficSigns[i],
          trafficSigns,
        );
      } else {
        data = await generateRightTurnProhibitedQuestion(
          trafficSigns[i],
          trafficSigns,
        );
      }
      data.id = i + 1;
      lastId = i + 1;
      dataList.add(data);
    }

    dataList.shuffle();

    var questionData = await rootBundle.loadString(
      'assets/data/question_bank/${languageCode}_questions.json',
    );
    final List<dynamic> questionList = json.decode(questionData);

    List<QuestionData> mapList =
    questionList.map((json) {
      lastId = lastId + 1;
      json["id"] = lastId;
      return QuestionData.fromJson(json,fromQ: true);
    }).toList();

    dataList.addAll(mapList);

    dataList.shuffle();

    await savePracticeList(dataList);

  }



  Future<QuestionData> generateImageBasedQuestionFixed(
      var data,
      trafficSigns,
      ) async {
    // Step 1: Choose a random sign as the correct answer
    final correctSign = data;

    // Step 2: Filter to get incorrect options
    final incorrectSigns =
    trafficSigns
        .where((sign) => sign['sign'] != correctSign['sign'])
        .toList();

    // Step 3: Pick 3 random incorrect signs
    incorrectSigns.shuffle();
    final randomIncorrect = incorrectSigns.take(2).toList();

    // Step 4: Combine and shuffle options
    final allOptions = [
      correctSign['sign'],
      ...randomIncorrect.map((s) => s['sign']),
    ];
    allOptions.shuffle();

    // Step 5: Find the index of the correct answer
    final correctAnswerIndex = allOptions.indexOf(correctSign['sign']);

    return QuestionData.fromJson({
      "is_sign": true,
      'question': 'This sign represents...',
      'sign': correctSign['icon'],
      'options': allOptions,
      'correct_answer': correctAnswerIndex,
      'from_sign': true,
      'd_sign': correctSign['sign'],
      'd_icon': correctSign['icon'],
    });
  }

  Future<QuestionData> generateRightTurnProhibitedQuestion(
      var data,
      trafficSigns,
      ) async {
    String s = data["sign"].toString();

    final correctSign = trafficSigns.firstWhere(
          (sign) => sign['sign']?.toLowerCase() == s.toLowerCase(),
      orElse: () => {},
    );

    final incorrectSigns = trafficSigns.where((sign) => sign['sign']?.toLowerCase() != s.toLowerCase()).toList();

    incorrectSigns.shuffle();
    final randomIncorrect = incorrectSigns.take(2).toList();

    final allOptions =
    List<Map<String, dynamic>>.from(randomIncorrect)..add(correctSign)..shuffle();

    final optionIcons = allOptions.map((sign) => sign['icon']).toList();
    final correctAnswerIndex = optionIcons.indexOf(correctSign['icon']);

    return QuestionData.fromJson({
      'question': 'Which sign denotes \"$s\"?',
      'options': optionIcons,
      'answer': correctSign['icon'],
      'correct_answer': correctAnswerIndex,
      'sign': "",
      "is_sign": false,
      "is_option_sign": true,
      "from_sign": true,
      'd_sign': s,
      'd_icon': correctSign['icon'],
    });
  }
}