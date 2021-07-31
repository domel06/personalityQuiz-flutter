import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Result extends StatelessWidget {
  final int resultScore;
  var parser = EmojiParser();
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 5) {
      resultText = 'you are awesome' +
          Emoji('smile', parser.getEmoji('smile').code).code.toString();
    } else if (resultScore <= 10) {
      resultText =
          'at least' + Emoji('clap', parser.getEmoji('clap').code).code;
    } else {
      resultText = 'you are bad' + parser.emojify('disgusting');
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        FlatButton(
            onPressed: resetHandler,
            child: Text(
              'reset quiz',
              style: TextStyle(color: Colors.redAccent),
            ))
      ],
    ));
    // TODO: implement build
    throw UnimplementedError();
  }
}
