import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    const {
      'questionText': 'what\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4}
      ]
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answer': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Lion', 'score': 4},
        {'text': 'Tiger', 'score': 10}
      ]
    },
    {
      'questionText': 'your favorite instructor',
      'answer': [
        {'text': 'Max', 'score': 5},
        {'text':'Don', 'score': 3},
        {'text':'AMK', 'score':4},
        {'text':'Akshay', 'score':10}
        
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // constrcting array of object [{}] or Map on {}

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("MyApp"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              // refer on quiz dart

              // Column(
              //     children: [
              //       Question(questions[_questionIndex]['questionText']),
              //       // ... spred oparator , for nested list
              //       // it pull all the oparator add them to list ad individual value
              //       ...(questions[_questionIndex]['answer'] as List<String>)
              //           .map((answer) {
              //         return Answer(_answerQuestion, answer);
              //       }).toList()

              // RaisedButton(
              //   child: Text('Answer 1'),
              //   onPressed: _answerQuestion,
              // ),
              // RaisedButton(
              //   child: Text('Answer 2'),
              //   onPressed: () => print('answer 2'),
              // ),
              // RaisedButton(
              //   child: Text('Answer 1'),
              //   onPressed: _answerQuestion,
              // ),
              //   ],
              // )
              :
              // Result code in result dart
              Result(_totalScore, _resetQuiz)
          // Center(
          //     child: Text("You did it"),
          //   ),
          ),
    );
  }
}
