import 'dart:math';
import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';
import 'package:chemistry_challenge/themes/texts.dart';

import 'package:chemistry_challenge/components/appbar.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({
    super.key, 
    required this.title, 
    required this.description, 
    required this.challengeData, 
    required this.questionItem, 
    required this.answerItem
  });
  
  final String title;
  final String description;
  final List<Map<String, String>> challengeData;
  final String questionItem;
  final String answerItem;

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

  Widget buildScreen(title, question) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: ThemeTexts.title1Emphasized,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            question,
            style: ThemeTexts.title1Regular,
          ),
        ],
      ),
    );
  }

  Widget buildScreenButton(String title, Color? color, VoidCallback onPressed) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          title,
          style: ThemeTexts.bodyRegular,
        ),
      ),
    );
  }

  Widget buildAnswerButton(String answer) {
    Color? backgroundColor;
    if (answer == highlightedAnswer) {
      backgroundColor = answer == correctAnswer ? Theme.of(context).extension<ThemeColors>()?.green : Theme.of(context).extension<ThemeColors>()?.red;
    } else if (answer == selectedAnswer) {
      backgroundColor = Theme.of(context).extension<ThemeColors>()?.red;
    } else {
      backgroundColor = Theme.of(context).extension<ThemeColors>()?.grey;
    }

    return buildScreenButton(
      answer,
      backgroundColor,
      () => selectAnswer(answer)
    );
  }

  Widget finalScoreScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildScreen(
            '챌린지 완료',
            '$correctCount개의 문제를 맞추고, $incorrectCount개의 문제를 틀렸어요'
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: buildScreenButton(
                  '메인으로 나가기',
                  Theme.of(context).extension<ThemeColors>()!.grey,
                  mainPage
                ),
              ),
              Expanded(
                child: buildScreenButton(
                  '다시 시작하기',
                  Theme.of(context).extension<ThemeColors>()!.grey,
                  resetChallenge
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
        buildScreen(widget.title, currentItem[widget.questionItem]),
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

