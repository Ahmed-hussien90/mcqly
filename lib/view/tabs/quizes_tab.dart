import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mcqly/controller/fields_controller.dart';
import 'package:mcqly/service/mcq_service.dart';
import 'package:mcqly/view/screens/home/widget/field_card.dart';

class QuizzesTab extends StatelessWidget {
  const QuizzesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FieldsController(mcqService: McqService()),
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
            field: mcqController.fields[index],isQuiz:true
          ),
        )
    );
  }
}
