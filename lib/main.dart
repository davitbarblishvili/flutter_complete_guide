import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      "questionText": "what's your favorite color?",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 7},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 3}
      ]
    },
    {
      "questionText": "what's your favorite animal?",
      "answers": [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Lion', 'score': 5}
      ]
    },
    {
      "questionText": "Who's your favorite instructor",
      "answers": [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
      ]
    },
  ];

  var _questionIdx = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIdx < _questions.length) {}
    setState(() {
      _questionIdx += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIdx < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIdx: _questionIdx,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
