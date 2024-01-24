import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/anion_name.dart';

class ChallengeAnionName extends StatelessWidget {
  const ChallengeAnionName({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '음이온명 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(
        title: '음이온명 챌린지',
        description: '이 이온명에 해당하는 음이온은 무엇인가요?',
        challengeData: anionname,
        questionItem: 'name',
        answerItem: 'formula',
      ),
    );
  }
}