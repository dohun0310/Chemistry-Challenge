import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/elemental_name.dart';

class ChallengeElementalName extends StatelessWidget {
  const ChallengeElementalName({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '원소 기호 챌린지',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ChallengePage(
        title: '원소 기호 챌린지',
        description: '이 원소명에 해당하는 원자는 무엇인가요?',
        challengeData: elementalname,
        questionItem: 'name',
        answerItem: 'symbol',
      ),
    );
  }
}