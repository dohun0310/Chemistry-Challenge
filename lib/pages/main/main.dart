import 'package:flutter/material.dart';

import 'package:elemental_challenge/components/list_button.dart';
import 'package:elemental_challenge/pages/elemental_symbol/main.dart';

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

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ListButton(
                    title: '원소 기호 챌린지',
                    difficulty: '쉬움',
                    questionnum: 20,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '원소명 챌린지',
                    difficulty: '쉬움',
                    questionnum: 20,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '원자 번호 챌린지',
                    difficulty: '보통',
                    questionnum: 20,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '원소 챌린지',
                    difficulty: '어려움',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '음이온식 챌린지',
                    difficulty: '보통',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '양이온식 챌린지',
                    difficulty: '보통',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '이온식명 챌린지',
                    difficulty: '보통',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '이온식 챌린지',
                    difficulty: '보통',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),
                  const ListButton(
                    title: '분자식 챌린지',
                    difficulty: '보통',
                    questionnum: 50,
                    destinationPage: ChallengeElementalSymbol(),
                  ),

                ],
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
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
    );
  }
}