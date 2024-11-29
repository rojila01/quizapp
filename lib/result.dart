import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function() resetData;

  // Constructor to initialize score and resetData function
  Result(this.score, this.resetData);

  // Get the result phrase based on the score
  String get resultPhrase {
    if (score >= 8) {
      return 'You are a tech genius!';
    } else if (score >= 5) {
      return 'You are tech-savvy!';
    } else {
      return 'You might want to explore technology more!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the result phrase based on the score
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Display the score value
          Text(
            'Your score: $score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black87, // Slightly lighter color for score
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Restart quiz button
          ElevatedButton(
            onPressed: resetData,
            child: Text("Restart Quiz"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.blue, // Button background color
              foregroundColor: Colors.white, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
