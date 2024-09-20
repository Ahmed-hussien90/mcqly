class MCQModel {
  final String question;
  final String image;
  final List<String> answers;
  final int correctAnswer;
  
  MCQModel({
    required this.question,
    required this.image,
    required this.answers,
    required this.correctAnswer,
  });
  
  Map toJson(){
    return {
      'question': question,
      'image': image,
      'answers': answers,
      'correctAnswer': correctAnswer,
    };
  }
  
  static MCQModel fromJson(json){
    return MCQModel(
      question: json['question'],
      image: json['image'],
      answers: json['answers'],
      correctAnswer: json['correctAnswer'],
    );
  }
  
}