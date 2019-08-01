import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {

  final Function questionHandler;
  final String answerOptionText;
  AnswerOption(this.questionHandler, this.answerOptionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      MaterialButton(
        child: Text(answerOptionText,
            style: TextStyle(color: Colors.black.withOpacity(0.6),)
        ),
        elevation: 10,
        highlightElevation: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3)
        ),
        color: Colors.deepOrange[200],
        minWidth: 200,
        onPressed: questionHandler,
      ),
    );
  }
}
