import 'package:flutter/material.dart';

import '../../../model/mcq.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.questions});
  final List<MCQModel> questions;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}