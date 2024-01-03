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
  late bool _isChallengeCompleted = false;
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
    setState(() {
      _isChallengeCompleted = true;
    });
  }

  void _mainPage() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _resetChallenge() {
    setState(() {
      _isChallengeCompleted = false;
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
      body: _isChallengeCompleted ? _finalScoreScreen() : _challengeScreen(),
    );
  }

  Widget _finalScoreScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '챌린지 완료!',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '$_correctCount개의 문제를 맞추고, $_incorrectCount개의 문제를 틀렸어요',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: _mainPage,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('메인으로 나가기'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: _resetChallenge,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('다시 하기'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _challengeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '이 원소의 이름은 무엇인가요?',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                _currentItem['symbol'],
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _choices.map((answer) => Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () => _selectAnswer(answer),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(answer),
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
