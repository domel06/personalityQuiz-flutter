import 'package:flutter/cupertino.dart';


import './Question.dart';
import './Answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int qnIndex;
  final Function ansQn;


  Quiz

  (
  { @required this.questions,@required this.qnIndex,@ required this.ansQn}
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[qnIndex]['questionText']),
      ...(questions[qnIndex]['Answers'] as List<Map<String, Object>>).map((answer) {
        return Answer(()=>ansQn(answer['score']), answer['text']);
      }).toList() //buttons
    ]);
    // TODO: implement build
    throw UnimplementedError();
  }

}