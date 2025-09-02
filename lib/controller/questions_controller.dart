import 'dart:async';

import 'package:get/get.dart';

import '../model/question.dart';
import '../view/screens/questions/widget/result_dialog.dart';

class QuestionsController extends GetxController {
  final List<QuestionModel> questions; //list of questions
  final bool isQuiz; //whether it's quiz or just practice
  final String field; //field of the quiz

  late bool isShowedAnswers; //whether the answers are showed or not
  Timer? timer;  //timer for quiz
  int timerSeconds = 150; // 150 seconds for 10 quiz questions

  QuestionsController(this.questions, this.isQuiz, this.field);

  // Initialize the controller
  @override
  onInit() {
    resetAnswers();
    isShowedAnswers = false;
    if (isQuiz) {
      startTimer();
    }
    super.onInit();
  }

  // Clean up resources when the controller is closed
  @override
  onClose() {
    resetAnswers();
    isShowedAnswers = false;
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  // Show correct answers for all questions
  showAnswers() {
    isShowedAnswers = true;
    for (var question in questions) {
      if (question.selected == -1) {
        question.selected = question.correctAnswer;
      }
    }
    update();
  }

  // Choose an answer for a question
  chooseAnswer(int questionIndex, int answerIndex) {
    questions[questionIndex].selected = answerIndex;
    update();
  }

  // Reset all selected answers
  void resetAnswers() {
    for (var question in questions) {
      question.selected = -1;
    }
  }

  // Start the countdown timer
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

  // End the quiz and show the result dialog
  Future<void> endQuiz() async {
    int score = 0;
    for (var value in questions) {
      if (value.correctAnswer == value.selected) {
        score++;
      }
    }
    timer?.cancel();
    int? result = await Get.dialog(ResultDialog(score: score, field: field),
        barrierDismissible: false);
    if (result == 1) {
      showAnswers();
    }
  }
}
