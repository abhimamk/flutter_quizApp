import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    print(resultScore);
    print(this.resultScore);
    if (resultScore <= 20) {
      resultText = 'You are Awesome and innocent!';
    } else if (resultScore < 22) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 27) {
      resultText = 'you are .....strange?!';
    } else {
      resultText = 'your are lucky';
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
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Reset Quiz'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
