import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/ion_formula.dart';

class ChallengeIonFormula extends StatelessWidget {
  const ChallengeIonFormula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이온 챌린지',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const ChallengePage(
        title: '이온 챌린지',
        description: '이 이온에 해당하는 이온명은 무엇인가요?',
        challengeData: ionformula,
        questionItem: 'formula',
        answerItem: 'name',
      ),
    );
  }
}