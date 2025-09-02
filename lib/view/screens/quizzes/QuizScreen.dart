import 'package:flutter/material.dart';
import 'package:mcqly/model/question.dart';
import 'package:mcqly/view/base/main_appbar.dart';
import 'package:mcqly/view/screens/questions/widget/questions_list_widget.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.questions, required this.field});

  final List<QuestionModel> questions;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppbar(
          title: "$field Quiz",
        ),
        body: questions.isEmpty
            ? const Center(
                child: Text("There no data"),
              )
            : QuestionsListWidget(
                questions: questions,
                isQuiz: true,
                field: field,
              ));
  }
}
