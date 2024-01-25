import 'dart:math';
import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/appbar.dart';

class ChallengePage extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, String>> challengeData;
  final String questionItem;
  final String answerItem;

  const ChallengePage({super.key, required this.title, required this.description, required this.challengeData, required this.questionItem, required this.answerItem});

  @override
  ChallengePageState createState() => ChallengePageState();
}

class ChallengePageState extends State<ChallengePage> {
  final List<String> _usedItems = [];
  int _correctCount = 0;
  int _incorrectCount = 0;
  String _selectedAnswer = '';
  String _highlightedAnswer = '';

  late Map<String, dynamic> _currentItem;
  late List<String> _choices;
  late String _correctAnswer;
  late bool _isChallengeCompleted = false;
  late bool _isWaiting = false;
  static int resetThreshold = 10;

  @override
  void initState() {
    super.initState();
    _nextChallenge();
  }

  void _nextChallenge() {
    if (_usedItems.length >= widget.challengeData.length) {
      _showFinalScore();
      return;
    }
  
    final availableItems = widget.challengeData.where((item) => !_usedItems.contains(item[widget.questionItem])).toList();
    final random = Random();

    _currentItem = availableItems[random.nextInt(availableItems.length)];
    _usedItems.add(_currentItem[widget.questionItem]);
    _correctAnswer = _currentItem[widget.answerItem];

    final wrongAnswers = List<String>.from(widget.challengeData.map((e) => e[widget.answerItem]))
      ..remove(_correctAnswer);
    wrongAnswers.shuffle();

    _choices = wrongAnswers.take(3).toList()..add(_correctAnswer);
    _choices.shuffle();

    setState(() {});
  }

  void _selectAnswer(String answer) {
    if (_isWaiting) return;

    final bool isCorrect = answer == _correctAnswer;
    setState(() {
      _selectedAnswer = answer;
      _highlightedAnswer = isCorrect ? answer : _correctAnswer;
      _isWaiting = true;
    });

    if (isCorrect) {
      _correctCount++;
    } else {
      _incorrectCount++;
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (_usedItems.length == widget.challengeData.length) {
        _showFinalScore();
      } else {
        _nextChallenge();
      }

      setState(() {
        _selectedAnswer = '';
        _highlightedAnswer = '';
        _isWaiting = false;
      });
    });
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
      appBar: buildAppBar(context, widget.title),
      body: _isChallengeCompleted ? _finalScoreScreen() : _challengeScreen(),
    );
  }

  Widget _buildAnswerButton(String answer) {
    Color bgColor;
    if (answer == _highlightedAnswer) {
      bgColor = answer == _correctAnswer ? Colors.green : Colors.red;
    } else if (answer == _selectedAnswer) {
      bgColor = Colors.red;
    } else {
      bgColor = Colors.grey[300]!;
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () => _selectAnswer(answer),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, 
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(answer),
      ),
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
              Text(
                widget.description,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                _currentItem[widget.questionItem],
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
          child: _buildAnswerButton(answer),
        )).toList(),
        ),
      ],
    );
  }
}