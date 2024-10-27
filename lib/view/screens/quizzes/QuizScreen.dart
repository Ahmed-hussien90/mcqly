import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/model/question.dart';
import 'package:mcqly/view/base/main_appbar.dart';
import 'package:mcqly/view/screens/questions/widget/questions_list_widget.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key, required this.questions});

  List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    questions.shuffle();
    questions = questions.sublist(0, 10);
    return Scaffold(
        appBar: const MainAppbar(
          title: "MCQ Quiz",
        ),
        body: questions.isEmpty
            ? const Center(
                child: Text("There no data"),
              )
            : QuestionsListWidget(
                questions: questions,
                isQuiz: true,
              ));
  }
}
