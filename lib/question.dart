import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question; // The question text

  // Constructor to initialize the question text
  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures the question takes the full width
      margin: EdgeInsets.symmetric(vertical: 20), // Space around the question
      child: Text(
        question, // Displays the current question
        style: TextStyle(
          fontSize: 24, // Font size for better readability
          fontWeight: FontWeight.bold, // Bold to make it stand out
          color: Colors.black, // Text color
        ),
        textAlign: TextAlign.center, // Center-align the text
      ),
    );
  }
}
