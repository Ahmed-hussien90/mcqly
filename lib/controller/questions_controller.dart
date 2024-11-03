import 'package:get/get.dart';

import '../model/question.dart';

class QuestionsController extends GetxController {
  final List<QuestionModel> questions;
  final bool isQuiz;
  late bool isShowedAnswers;

  QuestionsController(this.questions, this.isQuiz);

  @override
  onInit() {
    resetAnswers();
    isShowedAnswers = false;
    super.onInit();
  }

  showAnswers() {
    isShowedAnswers = true;
    for (var question in questions) {
      if (question.selected == -1) {
        question.selected = question.correctAnswer;
      }
    }
    update();
  }

  chooseAnswer(int questionIndex, int answerIndex) {
    questions[questionIndex].selected = answerIndex;
    update();
  }

  void resetAnswers() {
    for (var question in questions) {
      question.selected = -1;
    }
  }
}
