class QuestionData {
  final int questionNumber;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final bool isSignOption;
  final bool isSign;
  final bool? fromSign;
  final String? sign;
  final String? displaySign;
  final String? displayIcon;
   int? userAnswer;
    int? id;

  QuestionData({
    required this.questionNumber,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.isSign,
    required this.isSignOption,
    this.sign,
    this.id,
    this.displaySign,
    this.fromSign,
    this.displayIcon,
    this.userAnswer,
  });

  factory QuestionData.fromJson(Map<String, dynamic> json, {fromQ = false,fromType=false}) {

    int i = (int.tryParse(json["correct_answer"].toString()))??-1;

    return QuestionData(
      questionNumber: json['question_number'] ??0,
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: fromQ ? i-1:i,
      isSignOption: json['is_option_sign'] ??false,
      isSign: json['is_sign'],
      sign: json['sign'],
      id: json['id'],
      displayIcon: json['d_sign']??"",
      displaySign: json['d_icon']??"",
      fromSign: json['from_sign']??false,
      userAnswer:fromType?-1: json['user_answer'] ??-1,
    );
  }


  toJson() {
    return {
      "question_number":questionNumber,
      "question":question,
      "options":options,
      "correct_answer":correctAnswer,
      "is_option_sign":isSignOption,
      "is_sign":isSign,
      "sign":sign,
      "d_sign":displaySign,
      "d_icon":displayIcon,
      "from_sign":fromSign,
      "user_answer":userAnswer,
      "id":id,
    };
  }


}