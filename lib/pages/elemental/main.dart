import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/elemental.dart';

class ChallengeElemental extends StatelessWidget {
  const ChallengeElemental({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '원소 기호 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(
        title: '원소 챌린지',
        description: '이 아래의 문제에 해당하는 답은 무엇인가요?',
        challengeData: elemental,
        questionItem: 'question',
        answerItem: 'answer',
      ),
    );
  }
}