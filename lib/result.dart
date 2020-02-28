import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result({@required this.totalScore, @required this.resetQuiz});

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You be Better';
    } else if (totalScore <= 12) {
      resultText = 'You be Baba';
    } else {
      resultText = 'You be Problem';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your score is ' + totalScore.toString() + '\n' + resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Reset Quiz'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
