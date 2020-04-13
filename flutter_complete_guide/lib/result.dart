import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //Accecpts the _totalScore value from main.dart and renders it as a defined property in this file as it is an expected int value
  final int resultScore;
  //Accecpts the _resetQuiz function from main.dart and renders it as a defined property in this file as it is an expected function value
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are maybe not human';
    } else {
      resultText = 'Yeh give up';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
