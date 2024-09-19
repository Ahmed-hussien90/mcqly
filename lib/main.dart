

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MCQly',
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
