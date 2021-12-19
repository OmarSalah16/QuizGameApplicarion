import 'package:flutter/material.dart';
import 'package:home/screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:home/models/QuizProvider.dart';

void main() {
  runApp(MyApp());
}

// ignore: camel_case_types
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuizProviders(),
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: Home_Screen()));
  }
}
