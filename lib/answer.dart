import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() answerPressed; // Callback for when the answer is pressed
  final String answer; // The answer text

  // Constructor to initialize the answerPressed callback and answer text
  Answer(this.answerPressed, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5), // Space between buttons
      child: ElevatedButton(
        onPressed: answerPressed, // Triggers the answerPressed callback
        child: Text(
          answer, // Display the answer text
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15), // Button padding
          backgroundColor: Color(0xFFD32F2F), // Button background color
          foregroundColor: Colors.white, // Text color
        ),
      ),
    );
  }
}
