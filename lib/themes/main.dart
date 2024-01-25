import 'package:flutter/material.dart';

class ThemeColor{
  Color white = const Color(0xFFFFFFFF);
  Color black = const Color(0xFF151515);
  Color lightgrey = const Color(0xFFDFDFDF);
  Color darkgrey = const Color(0xFF888888);
  Color red = const Color(0xFFFC4F4F);
  Color green = const Color(0xFF4AD871);
  Color blue = const Color(0xFF3C89FF);
  Color purple = const Color(0xFF6E10CC);
  Color yellow = const Color(0xFFFFBF44);
}

final lightTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: ThemeColor().purple,
    outline: ThemeColor().darkgrey,
    background: ThemeColor().white,
    onBackground: ThemeColor().black,
    brightness: Brightness.light,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    seedColor: ThemeColor().purple,
    outline: ThemeColor().lightgrey,
    background: ThemeColor().black,
    onBackground: ThemeColor().white,
    brightness: Brightness.dark,
  ),
);