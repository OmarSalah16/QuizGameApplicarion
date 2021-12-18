import 'package:flutter/material.dart';
import 'package:home/screens/Home_Screen.dart';
import 'package:home/screens/quiz.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.teal,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
            child: Column(
          children: [
            Image.asset('images/logo.png', scale: 1),
            const Text(
              'Computer Science Quiz',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              child: const Text('PLAY'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  primary: Colors.teal,
                  textStyle: TextStyle(fontSize: 30)),
            )
          ],
        )),
      ),
    );
  }
}
