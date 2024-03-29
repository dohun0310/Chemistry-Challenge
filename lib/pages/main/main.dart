import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

import 'package:chemistry_challenge/components/appbar.dart';
import 'package:chemistry_challenge/components/list_button.dart';

import 'package:chemistry_challenge/pages/elemental_symbol/main.dart';
import 'package:chemistry_challenge/pages/elemental_name/main.dart';
import 'package:chemistry_challenge/pages/elemental_number/main.dart';
import 'package:chemistry_challenge/pages/anion_formula/main.dart';
import 'package:chemistry_challenge/pages/anion_name/main.dart';
import 'package:chemistry_challenge/pages/cation_formula/main.dart';
import 'package:chemistry_challenge/pages/cation_name/main.dart';
import 'package:chemistry_challenge/pages/ion_formula/main.dart';
import 'package:chemistry_challenge/pages/ion_name/main.dart';
import 'package:chemistry_challenge/pages/chemical_formula/main.dart';
import 'package:chemistry_challenge/pages/chemical_compound/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    if (isTablet || isLandscape) {
      return const TabletLayout();
    } else {
      return const MobileLayout();
    }
  }
}

List<Widget> buildListButtons(BuildContext context) {
  return [
    ListButton(
      title: '원소 기호 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 20,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      destinationPage: const ChallengeElementalSymbol(),
    ),
    ListButton(
      title: '원소명 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 20,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      destinationPage: const ChallengeElementalName(),
    ),
    ListButton(
      title: '원자 번호 챌린지',
      difficulty: '보통',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 20,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      destinationPage: const ChallengeElementalNumber(),
    ),
    ListButton(
      title: '음이온 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 13,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      destinationPage: const ChallengeAnionFormula(),
    ),
    ListButton(
      title: '음이온명 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 13,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      destinationPage: const ChallengeAnionName(),
    ),
    ListButton(
      title: '양이온 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 13,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      destinationPage: const ChallengeCationFormula(),
    ),
    ListButton(
      title: '양이온명 챌린지',
      difficulty: '쉬움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      questionnum: 13,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.green,
      destinationPage: const ChallengeCationName(),
    ),
    ListButton(
      title: '이온 챌린지',
      difficulty: '보통',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      questionnum: 26,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      destinationPage: const ChallengeIonFormula(),
    ),
    ListButton(
      title: '이온명 챌린지',
      difficulty: '보통',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      questionnum: 26,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.yellow,
      destinationPage: const ChallengeIonName(),
    ),
    ListButton(
      title: '화학식 챌린지',
      difficulty: '어려움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.red,
      questionnum: 40,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.red,
      destinationPage: const ChallengeChemicalFormula(),
    ),
    ListButton(
      title: '화합물 챌린지',
      difficulty: '어려움',
      difficultyColor: Theme.of(context).extension<AppExtension>()!.colors.red,
      questionnum: 40,
      questionnumColor: Theme.of(context).extension<AppExtension>()!.colors.red,
      destinationPage: const ChallengeChemicalCompound(),
    ),
  ];
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, '메인'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: buildListButtons(context),
          ),
        ),
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, '메인'),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: buildListButtons(context).map((button) => 
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: button,
              )
            ).toList(),
          ),
        ),
      ),
    );
  }
}

