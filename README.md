
QuickQuiz
Changes:

Score Management:
Added a _totalScore variable to track the cumulative score across questions.
Updated the answerPressed function to add the score from each selected answer.

Timer Integration:
The timer is managed within the Quiz widget

Reset Functionality:
The _resetQuiz function resets _questionIndex and _totalScore to restart the quiz.

Timer Implementation:
Added a countdown timer using the Timer class from dart:async.
A _timeLeft variable tracks the seconds remaining for each question, starting at 10 seconds (configurable).
The timer decreases _timeLeft every second and automatically moves to the next question when it hits 0.
When an answer is selected, the timer stops, preventing further countdown.

UI Improvements:
Enhanced the question text with a bold font and a larger font size for better readability.
Added consistent vertical margins around the question text for spacing.

UI Enhancements:
Updated the button style using ElevatedButton.styleFrom:
Background Color: Set to a bright red (Color(0xFFD32F2F)) for visibility.
Text Color: Changed to white for better contrast.
Padding: Added vertical padding for a consistent look.
Added vertical margins around each button for spacing between answers.

Score Display:
Added the ability to display the total score at the end of the quiz.
Included logic to determine a feedback message (resultPhrase) based on the score:
Example:
Score ≥ 8: "You are a tech genius!"
Score ≥ 5: "You are tech-savvy!"
Score < 5: "You might want to explore technology more!“

Restart Logic:
The button calls resetData to reset the state in main.dart and restart the quiz.



