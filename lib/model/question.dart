class QuestionModel {
  final String question;
  final List<String> answers;
  final int correctAnswer;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Map toJson() {
    return {
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
    };
  }

  static QuestionModel fromJson(json) {
    return QuestionModel(
      question: json['question'],
      answers: json['answers'] != null ? (json['answers'] as List<Object?>)
          .map((e) => e.toString()).toList() : [],
      correctAnswer: json['correctAnswer'],
    );
  }

}