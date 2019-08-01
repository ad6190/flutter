import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main(){

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp>{

  var _questionIndex = 0;
  var _totalScore = 0;

  void _nextQuestion(int score){

    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });

    print(_questionIndex);
    print("I was clicked");
  }

  void _restartQuiz(){

    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

    print("I was restarted");
  }

  var questions = [
    {
      'questionText': 'What is the capital of South Africa?',
      'answerOptionTexts':
            [  {
                'text': 'Washington',
                'score': 0
                },
                {
                'text': 'Johannesberg',
                'score': 0
                },
                {
                'text': 'Cape Town',
                'score': 1
                },
                {
                'text': 'Nairobi',
                'score': 0
                },
          ]
    },
    {
      'questionText': 'What is the currency of Russia?',
      'answerOptionTexts':
            [  {
            'text': 'Rupee',
            'score': 0
            },
            {
            'text': 'Ruby',
            'score': 0
            },
            {
            'text': 'Ruble',
            'score': 1
            },
            {
            'text': 'Russian Dollar',
            'score': 0
            },
            ]

    }
    ,

  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
          backgroundColor: Colors.deepOrange[200],

        ),
        body: _questionIndex < questions.length ? Quiz(
            questions,
            _questionIndex,
            _nextQuestion
        ) :
    Result(_totalScore, _questionIndex, _restartQuiz)
    )
    );
  }


}