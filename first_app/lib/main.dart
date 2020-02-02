import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    //placing a _ in front of the class or variable name makes it private class
    // the class can be called only from the dart file in which it is declared
  }
}

//void main() =>runApp(MyApp());
class _MyAppState extends State<MyApp> {
  final _questions = const [
    // 'What\'s your favorite color?',
    // 'What\'s your favorite animal?',
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'red', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'blue', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'lion', 'score': 1},
        {'text': 'ant', 'score': 2},
        {'text': 'dog', 'score': 3},
        {'text': 'cat', 'score': 4}
      ]
    },
    {
      'questionText': 'What\'s your favorite operator?',
      'answers': [
        {'text': '+', 'score': 1},
        {'text': '-', 'score': 2},
        {'text': '*', 'score': 3},
        {'text': '/', 'score': 4},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
          _questionIndex=0;
          _totalScore=0;
        });
  }
  void _answerQuestion(int score) {
    //calls the build method
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      //_questionIndex = 0;
      print('you are done with your quiz!');
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return MaterialApp(home: Text('Hello'),);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        //body: Text('This is my default text!'),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
