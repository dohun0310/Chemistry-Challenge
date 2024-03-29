import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/chemical_compound.dart';

class ChallengeChemicalCompound extends StatelessWidget {
  const ChallengeChemicalCompound({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '화합물 챌린지',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ChallengePage(
        title: '화합물 챌린지',
        description: '이 화합물에 해당하는 화학식은 무엇인가요?',
        challengeData: chemicalcompound,
        questionItem: 'compound',
        answerItem: 'formula',
      ),
    );
  }
}