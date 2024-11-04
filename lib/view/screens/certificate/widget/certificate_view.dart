import 'package:flutter/material.dart';
import 'package:mcqly/utils/constant.dart';

class CertificationView extends StatelessWidget {
  final String name;
  final String field;

  const CertificationView({super.key, required this.name, required this.field});

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xffa16008);
    String date = getDate();
    return Container(
      width: 400,
      height: 300,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(cerBackground,width: 500,height: 300,fit: BoxFit.fill,),
          Positioned(
              top: 4,
              child: Column(
                children: [
                  const Text(
                    'Certificate',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 5),
                  ),
                  const Text(
                    "of completion",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                  Text(
                    "$field Quiz",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  const Text(
                    "to",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                  const SizedBox(
                      width: 300,
                      child: Divider(
                        color: textColor,
                      )),
                  Text(
                    "for completing $field quiz successfully",
                    style: const TextStyle(fontSize: 12, color: textColor),
                  )
                ],
              )),
          Positioned(
              bottom: 10,
              left: -2,
              child: Image.asset(
                appLogo,
                width: 40,
              )),
          const Positioned(
              bottom: 30,
              left: 100,
              child: Column(
                children: [
                  Text(
                    "Signature",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "MCQLY",
                    style: TextStyle(fontSize: 9, color: Colors.black,letterSpacing: 2),
                  ),
                ],
              )),
           Positioned(
              bottom: 30,
              right: 100,
              child: Column(
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                  date,
                    style: const TextStyle(fontSize: 9, color: Colors.black),
                  ),
                ],
              ))

        ],
      ),
    );
  }

  String getDate() {
    DateTime now = DateTime.now();
    return "${now.day}/${now.month}/${now.year}";
  }
}
