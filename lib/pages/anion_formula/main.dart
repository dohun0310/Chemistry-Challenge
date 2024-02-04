import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/anion_formula.dart';

class ChallengeAnionFormula extends StatelessWidget {
  const ChallengeAnionFormula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '음이온 챌린지',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ChallengePage(
        title: '음이온 챌린지',
        description: '이 음이온에 해당하는 이온명은 무엇인가요?',
        challengeData: anionformula,
        questionItem: 'formula',
        answerItem: 'name',
      ),
    );
  }
}