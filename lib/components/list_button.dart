import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

class ChallengeInfo extends StatelessWidget {
  const ChallengeInfo({
    super.key, 
    required this.label,
    required this.value,
    required this.backgroundColor,
  });
  
  final String label;
  final String value;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: ThemeTexts.caption1Emphasized.copyWith(
              color: Theme.of(context).extension<AppExtension>()!.colors.black,
            ),
          ),
          Text(
            value,
            style: ThemeTexts.caption1Regular.copyWith(
              color: Theme.of(context).extension<AppExtension>()!.colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ListButton extends StatelessWidget {
  const ListButton({
    super.key, 
    required this.title, 
    required this.difficulty, 
    required this.difficultyColor, 
    required this.questionnum, 
    required this.questionnumColor, 
    required this.destinationPage
  });

  final String title;
  final String difficulty;
  final Color difficultyColor;
  final int questionnum;
  final Color questionnumColor;
  final Widget destinationPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).extension<AppExtension>()!.colors.outline,
        )
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: ThemeTexts.bodyRegular.copyWith(
                    color: Theme.of(context).extension<AppExtension>()!.colors.text,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChallengeInfo(
                    label: "난이도",
                    value: difficulty,
                    backgroundColor: difficultyColor,
                  ),
                  const SizedBox(width: 12),
                  ChallengeInfo(
                    label: "문제 수",
                    value: questionnum.toString(),
                    backgroundColor: questionnumColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}