import 'package:firebase_database/firebase_database.dart';

import '../model/field.dart';

class McqService {
  static McqService? _instance;

  McqService._();

  factory McqService() => _instance ??= McqService._();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<List<Field>> getAllFields() async {
    DatabaseEvent fieldsRef = await _database.child('fields').once();
    return fieldsRef.snapshot.exists ? fieldsRef.snapshot.children
        .map((e) => Field.fromJson(e.value as Map))
        .toList() : [];
  }
}
