//Block of imports for packages
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

//Block of imports for files
import './quiz.dart';
import './result.dart';

/*void main() {
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// Leading _ makes the class a private class frop to make it public
class _MyAppState extends State<MyApp> {
  final _questions = const [
    //Create a map of key value paires
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 2},
        {'text': 'Dog', 'score': 1000},
        {'text': 'Cat', 'score': 500},
      ],
    },
    {
      'questionText': "What's your favorite car?",
      'answers': [
        {'text': 'BMW', 'score': 1000},
        {'text': 'Ford', 'score': 5},
        {'text': 'Dodge', 'score': 10},
        {'text': 'Ferrari', 'score': 15},
        {'text': 'Porsche', 'score': 500},
      ],
    },
  ];

  //Leading _ makes a property inside a class private
  //Defined Property
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  //Leading _ makes a method inside a class private
  //Defined Method
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            //Pass the total score and the reset quiz function too the result.dart class Result
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
