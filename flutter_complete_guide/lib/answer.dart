import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;

  //Add a constructor
  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text('Answer 1'),
        onPressed: null,
      ),
    );
  }
}
