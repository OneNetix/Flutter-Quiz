//Block of imports for packages
import 'package:flutter/material.dart';

//Block of imports for files
import './question.dart';
import './answer.dart';

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
  final questions = const [
    //Create a map of key value paires
    {
      'questionText': "What's your favorite color?",
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Dog', 'Cat']
    },
    {
      'questionText': "What's your favorite car?",
      'answers': ['BMW', 'Ford', 'Dodge', 'Ferrari', 'Porsche']
    },
  ];

  //Leading _ makes a property inside a class private
  //Defined Property
  var _questionIndex = 0;

  //Leading _ makes a method inside a class private
  //Defined Method
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  //Instead of calling text widget we call the class for question text which is a text widget but in a seperte file
                  Question(
                    //Access the questions list var then the questions index followed by the questions key value
                    questions[_questionIndex]['questionText'],
                  ),
                  //Call the answer button from the answer.dart file by calling the class name
                  //Dynamically create buttons based on questions list
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text("You did it"),
              ),
      ),
    );
  }
}
