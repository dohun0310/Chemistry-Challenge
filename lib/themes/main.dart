import 'package:flutter/material.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.white,
    required this.black,
    required this.grey,
    required this.red,
    required this.green,
    required this.blue,
    required this.purple,
    required this.yellow,
  });

  final Color? white;
  final Color? black;
  final Color? grey;
  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? purple;
  final Color? yellow;

  @override
  ThemeColors copyWith({Color? white, Color? black, Color? grey, Color? red, Color? green, Color? blue, Color? purple, Color? yellow}) {
    return ThemeColors(
      white: white ?? this.white,
      black: black ?? this.black,
      grey: grey ?? this.grey,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      yellow: yellow ?? this.yellow,
    );
  }

  @override
  ThemeColors lerp(ThemeColors? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      white: Color.lerp(white, other.white, t),
      black: Color.lerp(black, other.black, t),
      grey: Color.lerp(grey, other.grey, t),
      red: Color.lerp(red, other.red, t),
      green: Color.lerp(green, other.green, t),
      blue: Color.lerp(blue, other.blue, t),
      purple: Color.lerp(purple, other.purple, t),
      yellow: Color.lerp(yellow, other.yellow, t),
    );
  }

  @override
  String toString() => 'ThemeColors(white: $white, black: $black, grey: $grey, red: $red, green: $green, blue: $blue, purple: $purple, yellow: $yellow)';
}

final lightTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      white: Color(0xFFFFFFFF),
      black: Color(0xFF151515),
      grey: Color(0xFFB7B7B7),
      red: Color(0xFFFC4F4F),
      green: Color(0xFF4AD871),
      blue: Color(0xFF3C89FF),
      purple: Color(0xFF6E10CC),
      yellow: Color(0xFFFFBF44),
    ),
  ],
);

final darkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      white: Color(0xFFFFFFFF),
      black: Color(0xFF151515),
      grey: Color(0xFF303030),
      red: Color(0xFFFC4F4F),
      green: Color(0xFF4AD871),
      blue: Color(0xFF3C89FF),
      purple: Color(0xFF6E10CC),
      yellow: Color(0xFFFFBF44),
    ),
  ],
);