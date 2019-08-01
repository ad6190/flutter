import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final int question_count;
  final Function restartHandler;

  Result(this.score, this.question_count, this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("You got $score out of $question_count right!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: Colors.black.withOpacity(0.6)),
                ),
            MaterialButton(
              child: Text('Restart Quiz',
                  style: TextStyle(color: Colors.black.withOpacity(0.6),)
              ),
              elevation: 10,
              highlightElevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
              ),
              color: Colors.deepOrange[200],
              minWidth: 200,
              onPressed: restartHandler,
            ),
          ],
        ),
      );
  }
}
