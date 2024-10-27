import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.black),
            onPressed: () {
              Get.offAllNamed("/home");
            },
            child: const Text('BACK'),
          )
        ],
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
            )
          ],
        ),
      ),
    );
  }
}
