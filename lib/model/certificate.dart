class Certificate {

  final String fName;
  final String lName;
  final String date;
  final int score;

  Certificate({required this.fName, required this.lName, required this.date, required this.score});

  Map<String, dynamic> toJson() {
    return {
      'firstName': fName,
      'lastName': lName,
      'date': date,
     'score': score
    };
  }

  static Certificate fromJson(Map<String, dynamic> json) {
    return Certificate(
      fName: json['firstName'],
      lName: json['lastName'],
      date: json['date'],
      score: json['score'],
    );
  }

}