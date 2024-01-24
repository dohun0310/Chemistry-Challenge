import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/cation_formula.dart';

class ChallengeCationFormula extends StatelessWidget {
  const ChallengeCationFormula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '양이온 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(
        title: '양이온 챌린지',
        description: '이 양이온에 해당하는 이온명는 무엇인가요?',
        challengeData: cationformula,
        questionItem: 'formula',
        answerItem: 'name',
      ),
    );
  }
}