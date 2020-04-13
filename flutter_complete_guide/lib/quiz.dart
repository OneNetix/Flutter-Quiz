import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Instead of calling text widget we call the class for question text which is a text widget but in a seperte file
        Question(
          //Access the questions list var then the questions index followed by the questions key value
          questions[questionIndex]['questionText'],
        ),
        //Call the answer button from the answer.dart file by calling the class name
        //Dynamically create buttons based on questions list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
