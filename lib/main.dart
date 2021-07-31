import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Quiz.dart';
import './Result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  var _qnIndex = 0;
  final _questions = const [
    {
      'questionText': 'what is your best color',
      'Answers': [
        {'text': 'blue', 'score': 7},
        {'text': 'white', 'score': 1},
        {'text': 'yellow', 'score': 50}
      ],
    },
    {
      'questionText': 'what is your best actor',
      'Answers': [
        {'text': 'jan', 'score': 2},
        {'text': 'ann', 'score': 3},
        {'text': 'glo', 'score': 4}
      ],
    },
    {
      'questionText': 'what is your best country',
      'Answers': [
        {'text': 'tz', 'score': 1},
        {'text': 'euro', 'score': 9},
        {'text': 'spain', 'score': 6},
        {'text': 'mongol', 'score': 8}
      ],
    },
  ];

  var _totalScore=0;
  void _resetQuiz(){
    setState(() {
      _totalScore=0;
      _qnIndex=0;
    });
  }

  void _ansQun(int score) {
    _totalScore += score;
    setState(() {
      _qnIndex = _qnIndex + 1;
    });
    print(_qnIndex);
    if (_qnIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('my quizz app'),
          ),
          body: _qnIndex < _questions.length
              ? Quiz(
                  ansQn: _ansQun,
                  qnIndex: _qnIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz)),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
