import 'dart:math';
import 'package:flutter/material.dart';

import 'package:elemental_challenge/components/elemental.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '원소 기호 퀴즈',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(),
    );
  }
}

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  final List<String> _usedElementsSymbols = [];
  int _correctCount = 0;
  int _incorrectCount = 0;


  late Map<String, dynamic> _currentElement;
  late List<String> _choices;
  late String _correctAnswer;

  @override
  void initState() {
    super.initState();
    _nextQuiz();
  }

  void _nextQuiz() {
    final availableElements = elements.where((element) => !_usedElementsSymbols.contains(element['symbol'])).toList();
    
    if (availableElements.isEmpty) {
      _usedElementsSymbols.clear();
      return;
    }

    final random = Random();
    _currentElement = availableElements[random.nextInt(availableElements.length)];
    _usedElementsSymbols.add(_currentElement['symbol']);

    _correctAnswer = _currentElement['name'];

    final wrongAnswers = List<String>.from(elements.map((e) => e['name']))
      ..remove(_correctAnswer);
    for (String symbol in _usedElementsSymbols) {
      wrongAnswers.removeWhere((name) => elements.firstWhere((element) => element['symbol'] == symbol)['name'] == name);
    }
    wrongAnswers.shuffle();

    _choices = wrongAnswers.take(3).toList()..add(_correctAnswer);
    _choices.shuffle();

    setState(() {});
  }

  void _selectAnswer(String answer) {
    final bool isCorrect = answer == _correctAnswer;
    if (isCorrect) {
      _correctCount++;
    } else {
      _incorrectCount++;
    }

    if (_usedElementsSymbols.length == elements.length) {
      _showFinalScore();
    } else {
      _nextQuiz();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('퀴즈 완료!'),
        content: Text('정답: $_correctCount개, 오답: $_incorrectCount개'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('다시 시작'),
            onPressed: () {
              Navigator.of(ctx).pop();
              _resetQuiz();
            },
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      _usedElementsSymbols.clear();
      _correctCount = 0;
      _incorrectCount = 0;
      _nextQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('원소 기호 퀴즈'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '이 원소의 이름은 무엇인가요?',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            _currentElement['symbol'],
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          ..._choices.map((answer) => ListTile(
                title: Text(answer),
                onTap: () => _selectAnswer(answer),
              )),
        ],
      ),
    );
  }
}
