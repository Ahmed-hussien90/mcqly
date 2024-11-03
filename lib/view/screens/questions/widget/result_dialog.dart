import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.score, required this.field});

  final int score;
  final String field;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        alignment: Alignment.center,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                score > 5
                    ? const Icon(
                        FontAwesome.face_laugh,
                        size: 50,
                        color: Colors.green,
                      )
                    : const Icon(
                        IonIcons.sad,
                        size: 50,
                        color: Colors.red,
                      ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: score / 10,
                    color: score > 5 ? Colors.green : Colors.redAccent,
                    strokeWidth: 10,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your Score: $score of 10",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red),
                  onPressed: () {
                    Get.offAllNamed("/home");
                  },
                  child: const Text('Exit'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green),
                  onPressed: () {
                    Get.back(result: 1);
                  },
                  child: const Text('Show Answers'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: score >= 5,
              child: ElevatedButton.icon(
                icon: const Icon(LineAwesome.certificate_solid),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.green),
                onPressed: () {
                  TextEditingController name = TextEditingController();
                  Get.dialog(AlertDialog(
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          LineAwesome.certificate_solid,
                          color: Colors.yellowAccent,
                          size: 50,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Congratulations! You passed the quiz. Please enter your full name to receive a certificate.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        CupertinoTextField(
                          controller: name,
                          placeholder: "Full Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                             Get.toNamed("certificate",arguments: [name.text,field]);
                          },
                          child: const Text('Get Certificate'),
                        )
                      ],
                    ),
                  ));
                },
                label: const Text('Get Certificate'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
