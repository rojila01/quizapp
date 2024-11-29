import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'question': 'What is the chemical symbol for water?',
      'answers': [
        {'text': 'H2O', 'score': 2},
        {'text': 'O2', 'score': 0},
        {'text': 'CO2', 'score': 0},
        {'text': 'NaCl', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': [
        {'text': 'Mars', 'score': 2},
        {'text': 'Earth', 'score': 0},
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Venus', 'score': 0},
      ],
    },
    {
      'question': 'What is the speed of light in a vacuum?',
      'answers': [
        {'text': '299,792,458 m/s', 'score': 2},
        {'text': '150,000,000 m/s', 'score': 1},
        {'text': '3,000 m/s', 'score': 0},
        {'text': '30,000 m/s', 'score': 0},
      ],
    },
    {
      'question': 'Which gas is most abundant in Earth’s atmosphere?',
      'answers': [
        {'text': 'Nitrogen', 'score': 2},
        {'text': 'Oxygen', 'score': 1},
        {'text': 'Carbon Dioxide', 'score': 0},
        {'text': 'Hydrogen', 'score': 0},
      ],
    },
    {
      'question': 'What is the chemical formula for table salt?',
      'answers': [
        {'text': 'NaCl', 'score': 2},
        {'text': 'KCl', 'score': 0},
        {'text': 'CaCl2', 'score': 0},
        {'text': 'MgCl2', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerPressed(int score) {
    setState(() {
      _totalScore += score; // Add the score from the selected answer
      _questionIndex += 1;  // Move to the next question
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QuickQuiz"),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          questionIndex: _questionIndex,
          questions: _questions,
          answerQuestion: _answerPressed,
        )
            : Result(_totalScore, _resetQuiz), // Pass the score to the Result widget
      ),
    );
  }
}
