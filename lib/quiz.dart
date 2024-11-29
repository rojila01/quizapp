import 'dart:async'; // For Timer functionality
import 'package:flutter/material.dart';
import 'package:quiz3/answer.dart';
import 'package:quiz3/question.dart';

class Quiz extends StatefulWidget {
  final int questionIndex; // Current question index
  final List<Map<String, Object>> questions; // List of questions and answers
  final Function(int) answerQuestion; // Callback function when an answer is selected

  Quiz({
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late int _timeLeft; // Time left for each question
  late Timer _timer; // Timer instance

  @override
  void initState() {
    super.initState();
    _timeLeft = 10; // Set initial time for each question (10 seconds)
    _startTimer(); // Start the timer when the quiz starts
  }

  // Start the timer for each question
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer.cancel(); // Stop the timer once time runs out
        // Here, you can handle what happens when time is up (e.g., auto move to next question)
        widget.answerQuestion(0); // Assuming no score if time runs out
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display current question
        Question(widget.questions[widget.questionIndex]['question'].toString()),

        SizedBox(height: 20), // Add spacing between question and answers

        // Timer display
        Text(
          'Time left: $_timeLeft',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 20),

        // Display answer choices
        ...(widget.questions[widget.questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
                () => widget.answerQuestion(answer['score'] as int), // Trigger the answer selection
            answer['text'].toString(),
          );
        }).toList(),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}



