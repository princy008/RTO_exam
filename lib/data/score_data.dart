import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/question_data.dart';

class ScoreData {

  Future<List<QuestionData>> loadExamList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? jsonList = prefs.getStringList('key_score_data');

    if (jsonList == null) return [];

    return jsonList.map((item) => QuestionData.fromJson(json.decode(item))).toList();
  }

  Future<void> saveExamList(List<QuestionData> list,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = list.map((person) => json.encode(person.toJson())).toList();
    await prefs.setStringList('key_score_data', jsonList);
  }

}