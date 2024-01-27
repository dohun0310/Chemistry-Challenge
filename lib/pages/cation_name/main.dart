import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/cation_name.dart';

class ChallengeCationName extends StatelessWidget {
  const ChallengeCationName({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '양이온명 챌린지',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const ChallengePage(
        title: '양이온명 챌린지',
        description: '이 이온명에 해당하는 양이온은 무엇인가요?',
        challengeData: cationname,
        questionItem: 'name',
        answerItem: 'formula',
      ),
    );
  }
}