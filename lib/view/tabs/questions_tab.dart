import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/controller/mcq_controller.dart';
import 'package:mcqly/service/mcq_service.dart';
import 'package:mcqly/view/screens/home/widget/field_card.dart';

class QuestionsTab extends StatelessWidget {
  const QuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: McqController(mcqService: McqService()),
      builder: (mcqController) =>  mcqController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : mcqController.fields.isEmpty
              ? const Center(
            child: Text("There no data"),
          )
              : ListView.builder(
            shrinkWrap: true,
            itemCount: mcqController.fields.length,
            itemBuilder: (context, index) => FieldCard(
              field: mcqController.fields[index],
            ),
          )
    );
  }
}