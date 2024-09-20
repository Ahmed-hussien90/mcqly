import 'mcq.dart';

class Field {
  final String image;
  final String title;
  final String description;
  final List<MCQModel> questions;

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
      questions: json['questions']
          .map((question) => MCQModel.fromJson(question))
          .toList(),
    );
  }
}
