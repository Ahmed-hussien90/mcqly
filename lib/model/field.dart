import 'question.dart';

class Field {
  final String image;
  final String title;
  final String description;
  final List<QuestionModel> questions;

  const Field({
    required this.image,
    required this.title,
    required this.description,
    required this.questions,
  });

  Map toJson() {
    return {'image': image, 'title': title, 'description': description};
  }

  static Field fromJson(Map json) {
    return Field(
      image: json['image'],
      title: json['title'],
      description: json['description'],
      questions: json['questions']!=null ? (json['questions'] as List<Object?>)
          .map((question) => QuestionModel.fromJson(question))
          .toList(): [],
    );
  }
}
