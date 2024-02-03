import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/chemical_formula.dart';

class ChallengeChemicalFormula extends StatelessWidget {
  const ChallengeChemicalFormula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '화학식 챌린지',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const ChallengePage(
        title: '화학식 챌린지',
        description: '이 화학식에 해당하는 화합물은 무엇인가요?',
        challengeData: chemicalformula,
        questionItem: 'formula',
        answerItem: 'compound',
      ),
    );
  }
}