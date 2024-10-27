import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mcqly/model/question.dart';
import 'package:mcqly/view/screens/questions/widget/result_dialog.dart';

class QuestionsListWidget extends StatefulWidget {
  final bool isQuiz;
  final List<QuestionModel> questions;

  const QuestionsListWidget(
      {super.key, this.isQuiz = false, required this.questions});

  @override
  State<QuestionsListWidget> createState() => _QuestionsListWidgetState();
}

class _QuestionsListWidgetState extends State<QuestionsListWidget> {
  List<int> correctAnswers = [];

  @override
  void initState() {
    correctAnswers = List.generate(widget.questions.length, (e) => 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2;
    double cardHeight = MediaQuery.of(context).size.height / 10;

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.isQuiz ? 10 : widget.questions.length,
              itemBuilder: (context, index) {
                final mcqModel = widget.questions[index];
                int correct = mcqModel.correctAnswer;
                RxInt selected = (-1).obs;
                return Card(
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        "${index + 1}- ${mcqModel.question}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      const SizedBox(height: 5),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: cardWidth / cardHeight),
                          itemCount: mcqModel.answers.length,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, i) {
                            final answer = mcqModel.answers[i];
                            return Obx(
                              () => Center(
                                child: Card(
                                  color: widget.isQuiz
                                      ? Colors.white12
                                      : (i == correct && selected.value != -1)
                                          ? Colors.green
                                          : (selected.value == i &&
                                                  i != correct)
                                              ? Colors.red
                                              : Colors.white12,
                                  shadowColor: Colors.white12,
                                  surfaceTintColor: Colors.white12,
                                  elevation: 0,
                                  child: Transform.scale(
                                    scale: 0.8,
                                    origin: const Offset(-30, 0),
                                    child: RadioListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      value: i,
                                      activeColor: widget.isQuiz
                                          ? Colors.green
                                          : Colors.white,
                                      groupValue: selected.value,
                                      hoverColor: Colors.red,
                                      onChanged: (v) {
                                        if (v != null) {
                                          selected.value = v;
                                          if (selected.value == correct) {
                                            correctAnswers[index] = 1;
                                          } else {
                                            correctAnswers[index] = 0;
                                          }
                                        }
                                      },
                                      title: Text(
                                        answer,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      Visibility(
                        visible: !widget.isQuiz,
                        child: Obx(
                          () => Visibility(
                            visible: selected.value != -1,
                            child: Text(
                              "The Correct answer is ${mcqModel.answers[correct]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.green),
                            ).paddingAll(5),
                          ),
                        ),
                      )
                    ],
                  ).paddingSymmetric(vertical: 5),
                ).paddingAll(5);
              }),
          Visibility(
            visible: widget.isQuiz,
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                onPressed: () {
                  int score = correctAnswers.where((e) => e == 1).length;
                  Get.dialog(
                      ResultDialog(score:score),
                      barrierDismissible: false);
                },
                child: const Text("Submit"),
              ).paddingSymmetric(vertical: 20),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
