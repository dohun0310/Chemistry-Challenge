import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/chemical_formula.dart';

class ChallengeChemicalFormula extends StatelessWidget {
  const ChallengeChemicalFormula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '화학식 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(
        title: '화학식 챌린지',
        description: '이 화학식에 해당하는 화합물는 무엇인가요?',
        challengeData: chemicalformula,
        questionItem: 'formula',
        answerItem: 'compound',
      ),
    );
  }
}