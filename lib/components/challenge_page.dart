import 'dart:math';
import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

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
  final List<String> usedItems = [];
  int correctCount = 0;
  int incorrectCount = 0;
  String selectedAnswer = '';
  String highlightedAnswer = '';

  late Map<String, dynamic> currentItem;
  late List<String> choices;
  late String correctAnswer;
  late bool isChallengeCompleted = false;
  late bool isWaiting = false;
  static int resetThreshold = 10;

  @override
  void initState() {
    super.initState();
    nextChallenge();
  }

  void nextChallenge() {
    if (usedItems.length >= widget.challengeData.length) {
      showFinalScore();
      return;
    }
  
    final availableItems = widget.challengeData.where((item) => !usedItems.contains(item[widget.questionItem])).toList();
    final random = Random();

    currentItem = availableItems[random.nextInt(availableItems.length)];
    usedItems.add(currentItem[widget.questionItem]);
    correctAnswer = currentItem[widget.answerItem];

    final wrongAnswers = List<String>.from(widget.challengeData.map((e) => e[widget.answerItem]))
      ..remove(correctAnswer);
    wrongAnswers.shuffle();

    choices = wrongAnswers.take(3).toList()..add(correctAnswer);
    choices.shuffle();

    setState(() {});
  }

  void selectAnswer(String answer) {
    if (isWaiting) return;

    final bool isCorrect = answer == correctAnswer;
    setState(() {
      selectedAnswer = answer;
      highlightedAnswer = isCorrect ? answer : correctAnswer;
      isWaiting = true;
    });

    if (isCorrect) {
      correctCount++;
    } else {
      incorrectCount++;
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (usedItems.length == widget.challengeData.length) {
        showFinalScore();
      } else {
        nextChallenge();
      }

      setState(() {
        selectedAnswer = '';
        highlightedAnswer = '';
        isWaiting = false;
      });
    });
  }

  void showFinalScore() {
    setState(() {
      isChallengeCompleted = true;
    });
  }

  void mainPage() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void resetChallenge() {
    setState(() {
      isChallengeCompleted = false;
      usedItems.clear();
      correctCount = 0;
      incorrectCount = 0;
      nextChallenge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, widget.title),
      body: isChallengeCompleted ? finalScoreScreen() : challengeScreen(),
    );
  }

  Widget buildAnswerButton(String answer) {
    Color? backgroundColor;
    if (answer == highlightedAnswer) {
      backgroundColor = answer == correctAnswer ?  Colors.green : Colors.red;
    } else if (answer == selectedAnswer) {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.grey[300];
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () => selectAnswer(answer),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(answer),
      ),
    );
  }

  Widget finalScoreScreen() {
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
                  '$correctCount개의 문제를 맞추고, $incorrectCount개의 문제를 틀렸어요',
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
                    onPressed: mainPage,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
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
                    onPressed: resetChallenge,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
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

  Widget challengeScreen() {
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
                currentItem[widget.questionItem],
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
        children: choices.map((answer) => Expanded(
          child: buildAnswerButton(answer),
        )).toList(),
        ),
      ],
    );
  }
}