import 'package:flutter/material.dart';

import 'package:chemistry_challenge/components/list_button.dart';
import 'package:chemistry_challenge/pages/elemental_symbol/main.dart';
import 'package:chemistry_challenge/pages/elemental_name/main.dart';
import 'package:chemistry_challenge/pages/elemental_number/main.dart';
import 'package:chemistry_challenge/pages/anion_formula/main.dart';
import 'package:chemistry_challenge/pages/anion_name/main.dart';
import 'package:chemistry_challenge/pages/cation_formula/main.dart';
import 'package:chemistry_challenge/pages/cation_name/main.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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

List<Widget> _buildListButtons() {
  return [
    const ListButton(
      title: '원소 기호 챌린지',
      difficulty: '쉬움',
      difficultyColor: Colors.green,
      questionnum: 20,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalSymbol(),
    ),
    const ListButton(
      title: '원소명 챌린지',
      difficulty: '쉬움',
      difficultyColor: Colors.green,
      questionnum: 20,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalName(),
    ),
    const ListButton(
      title: '원자 번호 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 20,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalNumber(),
    ),
    const ListButton(
      title: '음이온 챌린지',
      difficulty: '쉬움',
      difficultyColor: Colors.green,
      questionnum: 12,
      questionnumColor: Colors.green,
      destinationPage: ChallengeAnionFormula(),
    ),
    const ListButton(
      title: '음이온명 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 12,
      questionnumColor: Colors.green,
      destinationPage: ChallengeAnionName(),
    ),
    const ListButton(
      title: '양이온 챌린지',
      difficulty: '쉬움',
      difficultyColor: Colors.green,
      questionnum: 12,
      questionnumColor: Colors.green,
      destinationPage: ChallengeCationFormula(),
    ),
    const ListButton(
      title: '양이온명 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 12,
      questionnumColor: Colors.green,
      destinationPage: ChallengeCationName(),
    ),
    const ListButton(
      title: '이온 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 50,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalSymbol(),
    ),
    const ListButton(
      title: '이온명 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 50,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalSymbol(),
    ),
    const ListButton(
      title: '분자식 챌린지',
      difficulty: '보통',
      difficultyColor: Colors.green,
      questionnum: 50,
      questionnumColor: Colors.green,
      destinationPage: ChallengeElementalSymbol(),
    ),
  ];
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                _buildListButtons(),
              ),
            ),
          ],
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
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildListDelegate(
                _buildListButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}