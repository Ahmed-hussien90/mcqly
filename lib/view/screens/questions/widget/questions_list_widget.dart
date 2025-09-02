import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/controller/questions_controller.dart';
import 'package:mcqly/model/question.dart';
import 'package:mcqly/view/screens/questions/widget/result_dialog.dart';

class QuestionsListWidget extends StatefulWidget {
  final bool isQuiz;
  final List<QuestionModel> questions;
  final String field;

  const QuestionsListWidget(
      {super.key, this.isQuiz = false, required this.questions, required this.field});

  @override
  State<QuestionsListWidget> createState() => _QuestionsListWidgetState();
}

class _QuestionsListWidgetState extends State<QuestionsListWidget> {


  @override
  void dispose() {
    Get.delete<QuestionsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2;
    double cardHeight = MediaQuery.of(context).size.height / 10;

    return GetBuilder(
        init: QuestionsController(widget.questions, widget.isQuiz, widget.field),
        builder: (questionController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                    visible: widget.isQuiz,
                    child:  Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer, color: Colors.white),
                          const SizedBox(width: 5),
                          Text(
                            "${questionController.timerSeconds} sec",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.isQuiz ? 10 : widget.questions.length,
                    itemBuilder: (context, index) {
                      final mcqModel = widget.questions[index];
                      int correct = mcqModel.correctAnswer;
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
                                        childAspectRatio:
                                            cardWidth / cardHeight),
                                itemCount: mcqModel.answers.length,
                                padding: const EdgeInsets.all(0),
                                itemBuilder: (context, i) {
                                  final answer = mcqModel.answers[i];
                                  return GestureDetector(
                                    onTap: () {
                                      questionController.chooseAnswer(index, i);
                                    },
                                    child: Card(
                                      color: (widget.isQuiz &&
                                              !questionController
                                                  .isShowedAnswers)
                                          ? Colors.white12
                                          : (i == correct &&
                                                  questionController
                                                          .questions[index]
                                                          .selected !=
                                                      -1)
                                              ? Colors.green
                                              : (questionController
                                                              .questions[index]
                                                              .selected ==
                                                          i &&
                                                      i != correct)
                                                  ? Colors.red
                                                  : Colors.white12,
                                      shadowColor: Colors.white12,
                                      surfaceTintColor: Colors.white12,
                                      elevation: 0,
                                      child: Row(
                                        children: [
                                          Radio(
                                            visualDensity: const VisualDensity(
                                                horizontal: VisualDensity
                                                    .minimumDensity,
                                                vertical: VisualDensity
                                                    .minimumDensity),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            value: i,
                                            activeColor: widget.isQuiz &&
                                                    !questionController
                                                        .isShowedAnswers
                                                ? Colors.green
                                                : Colors.white,
                                            groupValue: questionController
                                                .questions[index].selected,
                                            hoverColor: Colors.red,
                                            onChanged: (v) {
                                              if (v != null) {
                                                questionController.chooseAnswer(
                                                    index, i);
                                              }
                                            },
                                          ),
                                          Expanded(
                                            child: Text(
                                              answer,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            Visibility(
                              visible: (!widget.isQuiz ||
                                      questionController.isShowedAnswers) &&
                                  questionController
                                          .questions[index].selected !=
                                      -1,
                              child: Text(
                                "The Correct answer is ${mcqModel.answers[correct]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.green),
                              ).paddingAll(5),
                            ),
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
                      onPressed: () async {

                      },
                      child: const Text("Submit"),
                    ).paddingSymmetric(vertical: 20),
                  ),
                )
              ],
            ),
          );
        });
  }

  bool get wantKeepAlive => true;
}
