// import 'package:get/get.dart';
// import 'package:rto_exam/screens/score/score_card_screen.dart';
//
// class ScoreCardController extends GetxController {
//   // Reactive variables
//   var correctCount = 7.obs;
//   var wrongCount = 8.obs;
//
//   var questions = <QuestionItem>[
//     QuestionItem(
//       question: 'Parking is prohibited in the following place...',
//       yourAnswer: 'Left side of the road',
//       rightAnswer: 'Entrance of hospital',
//       isCorrect: false,
//     ),
//     QuestionItem(
//       question:
//       'When you approach an intersection and you are in main road without traffic lights, police man and traffic signs, you should...',
//       yourAnswer: 'Slow down and be cautious to negotiate the intersection',
//       rightAnswer: '',
//       isCorrect: true,
//     ),
//     QuestionItem(
//       question: 'Maximum permissible speed of a two wheeler near educational institution',
//       yourAnswer: '30 km/hour',
//       rightAnswer: '25 km/hour',
//       isCorrect: false,
//     ),
//     QuestionItem(
//       question: 'When going straight ahead at around about...',
//       yourAnswer: 'no signals is required',
//       rightAnswer: '',
//       isCorrect: true,
//     ),
//   ].obs;
//
// }
//
// class QuestionItem {
//   final String question;
//   final String yourAnswer;
//   final String rightAnswer;
//   final bool isCorrect;
//
//   QuestionItem({
//     required this.question,
//     required this.yourAnswer,
//     required this.rightAnswer,
//     required this.isCorrect,
//   });
// }
import 'package:get/get.dart';

import '../../data/score_data.dart';
import '../../model/question_data.dart';

class ScoreCardController extends GetxController {
  var correctCount = 0.obs;
  var wrongCount = 0.obs;
  var questionList = <QuestionData>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadExam();
  }

  loadExam() async {
    questionList.value = await ScoreData().loadExamList();

    for (var question in questionList) {
      if (question.userAnswer != null && question.userAnswer != -1) {
        if (question.userAnswer == question.correctAnswer) {
          correctCount.value++;
        } else {
          wrongCount.value++;
        }
      }
    }

  }

  String getQuestionSign(item) {

    if (item.fromSign ?? false) {
      return item.sign ?? "";
    } else if (item.isSign) {
      return item.sign ?? "";
    } else {
      return "";
    }
  }
}

