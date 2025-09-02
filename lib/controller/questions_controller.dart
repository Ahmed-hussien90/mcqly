import 'dart:async';

import 'package:get/get.dart';

import '../model/question.dart';
import '../view/screens/questions/widget/result_dialog.dart';

class QuestionsController extends GetxController {
  final List<QuestionModel> questions;
  final bool isQuiz;
  final String field;

  late bool isShowedAnswers;
  Timer? timer;
  int timerSeconds = 150; // 150 seconds for 10 questions

  QuestionsController(this.questions, this.isQuiz, this.field);

  @override
  onInit() {
    resetAnswers();
    isShowedAnswers = false;
    if (isQuiz) {
      startTimer();
    }
    super.onInit();
  }

  @override
  onClose() {
    resetAnswers();
    isShowedAnswers = false;
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
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

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        timerSeconds--;
        update();
      } else {
        timer.cancel();
        endQuiz();
      }
    });
  }

  Future<void> endQuiz() async {
    int score = 0;
    for (var value in questions) {
      if (value.correctAnswer == value.selected) {
        score++;
      }
    }
    int? result = await Get.dialog(ResultDialog(score: score, field: field),
        barrierDismissible: false);
    if (result == 1) {
      showAnswers();
    }
  }
}
