// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'Quiz.dart';

class QuizProviders extends ChangeNotifier {
  //Notes List
  List<Quiz> _quiz = <Quiz>[];

  List<Quiz> get getQuiz {
    return _quiz;
  }

// function to add data to list of notes
  void addQuizz(String title, String descriptions) {
    Quiz quiz = Quiz(title, descriptions);
    _quiz.add(quiz);
    notifyListeners();
  }

  // function to remove or delete notes by using list index position
  void removeQuiz(int index) {
    _quiz.removeAt(index);
    notifyListeners();
  }
}
