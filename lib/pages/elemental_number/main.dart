import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/elemental_number.dart';

class ChallengeElementalNumber extends StatelessWidget {
  const ChallengeElementalNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '원소 번호 챌린지',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ChallengePage(
        title: '원소 번호 챌린지',
        description: '이 원소 번호에 맞는 원자는 무엇인가요?',
        challengeData: elementalnumber,
        questionItem: 'number',
        answerItem: 'symbol',
      ),
    );
  }
}