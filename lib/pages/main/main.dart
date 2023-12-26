import 'package:flutter/material.dart';

import 'package:elemental_challenge/components/list_button.dart';
import 'package:elemental_challenge/pages/Challenge/main.dart';

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
                    questionnum: 50,
                    destinationPage: Challenge(),
                  ),
                  const ListButton(
                    title: 'Button 2',
                    difficulty: 'Easy',
                    questionnum: 50,
                    destinationPage: Challenge(),
                  ),
                  const ListButton(
                    title: 'Button 3',
                    difficulty: 'Easy',
                    questionnum: 50,
                    destinationPage: Challenge(),
                  ),
                  const ListButton(
                    title: 'Button 1',
                    difficulty: 'Easy',
                    questionnum: 50,
                    destinationPage: Challenge(),
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