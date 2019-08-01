import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final String questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return

      Container(
        width: double.infinity,
        margin: EdgeInsets.all(30),
        child: Text(
          questionText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.black.withOpacity(0.6)),
          textAlign: TextAlign.center,
    ),
      );
  }
}
