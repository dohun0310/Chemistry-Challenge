import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final String title;
  final String difficulty;
  final int questionnum;
  final Widget destinationPage;
  
  const ListButton({super.key, required this.title, required this.difficulty, required this.questionnum, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
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
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    difficulty,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  child: Text(
                    questionnum.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}