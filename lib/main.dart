import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  static const _questions = [
    {
      'questionText': 'What is Your name?',
      'answers': [
        {'text': 'Buhari', 'score': 1},
        {'text': 'Red', 'score': 31},
        {'text': 'John', 'score': 31},
        {'text': 'Yellow', 'score': 31}
      ]
    },
    {
      'questionText': 'What is Your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 77},
        {'text': 'Green', 'score': 33},
        {'text': 'Yellow', 'score': 31}
      ]
    },
    {
      'questionText': 'What is Your favourite car?',
      'answers': [
        {'text': 'Benz', 'score': 31},
        {'text': 'Range Rover', 'score': 3},
        {'text': 'Geralt', 'score': 31},
        {'text': 'Yucky', 'score': 3}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Basics'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(
                  totalScore: _totalScore,
                  resetQuiz: _resetQuiz,
                )),
    );
  }
}
