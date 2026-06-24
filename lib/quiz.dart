import 'package:flutter/material.dart';
import 'package:flutter_adv_basics_app/start_screen.dart';
import 'package:flutter_adv_basics_app/questions_screen.dart';
import 'package:flutter_adv_basics_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.from(alpha: 0.5, red: 0.48, green: 0.77, blue: 0.63),
                Color.from(alpha: 0.5, red: 0.72, green: 0.37, blue: 0.85),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionsScreen(onSelectAnswer: chooseAnswer),
        ),
      ),
    );
  }
}
