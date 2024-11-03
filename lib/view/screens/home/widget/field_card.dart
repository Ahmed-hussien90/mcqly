import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/model/field.dart';
import 'package:mcqly/utils/constant.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    super.key,
    required this.field,
    this.isQuiz = false,
  });

  final Field field;
  final bool isQuiz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isQuiz) {
          Get.toNamed('/questions', arguments: [field.questions,field.title]);
        } else {
          Get.toNamed('/quizzes', arguments: [field.questions,field.title]);
        }
      },
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Expanded(flex: 3, child: Image.network(field.image, height: 100)),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Text(
                    field.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    field.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: isQuiz,
                child: Expanded(
                    flex: 2,
                    child: Image.asset(
                      quizImage,
                    ))),
          ],
        ).paddingAll(10),
      ).paddingSymmetric(horizontal: 10, vertical: 5),
    );
  }
}
