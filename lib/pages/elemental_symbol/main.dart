import 'dart:math';
import 'package:flutter/material.dart';

import 'package:elemental_challenge/data/elemental_symbol.dart';

class ChallengeElementalSymbol extends StatelessWidget {
  const ChallengeElementalSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '원소 기호 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengeElementalSymbolPage(),
    );
  }
}

class ChallengeElementalSymbolPage extends StatefulWidget {
  const ChallengeElementalSymbolPage({super.key});

  @override
  ChallengeElementalSymbolState createState() => ChallengeElementalSymbolState();
}

class ChallengeElementalSymbolState extends State<ChallengeElementalSymbolPage> {
  final List<String> _usedItems = [];
  int _correctCount = 0;
  int _incorrectCount = 0;

  late Map<String, dynamic> _currentItem;
  late List<String> _choices;
  late String _correctAnswer;
  static int resetThreshold = 10;

  @override
  void initState() {
    super.initState();
    _nextChallenge();
  }

  void _nextChallenge() {
    if (_usedItems.length >= elementalsymbol.length) {
      _showFinalScore();
      return;
    }
  
    final availableItems = elementalsymbol.where((item) => !_usedItems.contains(item['symbol'])).toList();
    final random = Random();

    _currentItem = availableItems[random.nextInt(availableItems.length)];
    _usedItems.add(_currentItem['symbol']);
    _correctAnswer = _currentItem['name'];

    final wrongAnswers = List<String>.from(elementalsymbol.map((e) => e['name']))
      ..remove(_correctAnswer);
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

    if (_usedItems.length == elementalsymbol.length) {
      _showFinalScore();
    } else {
      _nextChallenge();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('챌린지 완료!'),
        content: Text('정답: $_correctCount개, 오답: $_incorrectCount개'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('다시 시작'),
            onPressed: () {
              Navigator.of(ctx).pop();
              _resetChallenge();
            },
          ),
        ],
      ),
    );
  }

  void _resetChallenge() {
    setState(() {
      _usedItems.clear();
      _correctCount = 0;
      _incorrectCount = 0;
      _nextChallenge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('원소 기호 챌린지'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            const Text(
              '이 원소의 이름은 무엇인가요?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              _currentItem['symbol'],
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _choices.map((answer) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text(answer),
                    onPressed: () => _selectAnswer(answer),
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
