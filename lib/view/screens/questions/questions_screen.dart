import 'package:flutter/material.dart';
import 'package:mcqly/view/screens/questions/widget/questions_list_widget.dart';

import '../../../model/question.dart';
import '../../base/main_appbar.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key, required this.questions, required this.field});

  List<QuestionModel> questions;
  final String field;

  @override
  Widget build(BuildContext context) {
    questions.shuffle();
    if (questions.length > 100) {
      questions = questions.sublist(0, 100);
    }
    return Scaffold(
        appBar: MainAppbar(title: "$field Questions",),
        body: questions.isEmpty
            ? const Center(
                child: Text("There no data"),
              )
            : QuestionsListWidget(
                questions: questions,
                field: field,
              ));
  }
}
