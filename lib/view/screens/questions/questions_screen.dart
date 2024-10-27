import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/view/screens/questions/widget/questions_list_widget.dart';

import '../../../model/question.dart';
import '../../base/main_appbar.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key, required this.questions});

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainAppbar(),
        body: questions.isEmpty
            ? const Center(
          child: Text("There no data"),
        )
            : QuestionsListWidget(questions: questions));
  }
}
