import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/challenge_page.dart';
import 'package:chemistry_challenge/data/ion_name.dart';

class ChallengeIonName extends StatelessWidget {
  const ChallengeIonName({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '이온명 챌린지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChallengePage(
        title: '이온명 챌린지',
        description: '이 이온명에 해당하는 이온은 무엇인가요?',
        challengeData: ionname,
        questionItem: 'name',
        answerItem: 'formula',
      ),
    );
  }
}