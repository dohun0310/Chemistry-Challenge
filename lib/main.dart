import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

import 'package:chemistry_challenge/pages/main/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '화학 챌린지',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeContent(),
    );
  }
}