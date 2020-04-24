import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //Property of Question class
  //Final before a property tells dart that the value will never change after the initalisation
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Container takes the full width of the screen with double.infiity and thus text widget now takes full width of the container allowing it to align center
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
