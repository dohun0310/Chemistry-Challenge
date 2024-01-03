import 'package:flutter/material.dart';

class ChallengeInfo extends StatelessWidget {
  final String label;
  final String value;
  final Color backgroundColor;

  const ChallengeInfo({
    super.key, 
    required this.label,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ListButton extends StatelessWidget {
  final String title;
  final String difficulty;
  final MaterialColor difficultyColor;
  final int questionnum;
  final MaterialColor questionnumColor;
  final Widget destinationPage;
  
  const ListButton({
    super.key, 
    required this.title, 
    required this.difficulty, 
    required this.difficultyColor, 
    required this.questionnum, 
    required this.questionnumColor, 
    required this.destinationPage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.grey, width: 1),
          ),
          elevation: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
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
