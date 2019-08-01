import 'package:flutter/material.dart';
import './question.dart';
import './answer_option.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function questionHandler;

  Quiz(this.questions, this.questionIndex, this.questionHandler);

  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            Question(questions[questionIndex]['questionText'], ),
            ...(questions[questionIndex]['answerOptionTexts'] as List<Map<String, Object>>).map(
                (answerOptionText) {
              return AnswerOption(() => questionHandler(answerOptionText['score']), answerOptionText['text']);
            }).toList(),
    ],
    );

  }
}
