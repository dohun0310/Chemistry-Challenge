import 'package:flutter/material.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.background,
    required this.onBackground,
    required this.grey,
    required this.red,
    required this.green,
    required this.blue,
    required this.purple,
    required this.yellow,
  });

  final Color? background;
  final Color? onBackground;
  final Color? grey;
  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? purple;
  final Color? yellow;

  @override
  ThemeColors copyWith({Color? background, Color? onBackground, Color? grey, Color? red, Color? green, Color? blue, Color? purple, Color? yellow}) {
    return ThemeColors(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
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
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      grey: Color.lerp(grey, other.grey, t),
      red: Color.lerp(red, other.red, t),
      green: Color.lerp(green, other.green, t),
      blue: Color.lerp(blue, other.blue, t),
      purple: Color.lerp(purple, other.purple, t),
      yellow: Color.lerp(yellow, other.yellow, t),
    );
  }

  @override
  String toString() => 'ThemeColors(background: $background, onBackground: $onBackground, grey: $grey, red: $red, green: $green, blue: $blue, purple: $purple, yellow: $yellow)';
}

final lightTheme = ThemeData.light().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF151515),
      grey: Color(0xFFB7B7B7),
      red: Color(0xFFFC4F4F),
      green: Color(0xFF4AD871),
      blue: Color(0xFF3C89FF),
      purple: Color(0xFF6E10CC),
      yellow: Color(0xFFFFBF44),
    ),
  ],

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF151515),
    onPrimary: Color(0xFFFFFFFF),
    error: Color(0xFFFC4F4F),
    background: Color(0xFFFFFFFF), 
    onBackground: Color(0xFF151515), 
  )
);

final darkTheme = ThemeData.dark().copyWith(
  extensions: <ThemeExtension<dynamic>>[
    const ThemeColors(
      background: Color(0xFF151515),
      onBackground: Color(0xFFFFFFFF),
      grey: Color(0xFF303030),
      red: Color(0xFFFC4F4F),
      green: Color(0xFF4AD871),
      blue: Color(0xFF3C89FF),
      purple: Color(0xFF6E10CC),
      yellow: Color(0xFFFFBF44),
    ),
  ],

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF151515),
    error: Color(0xFFFC4F4F),
    background: Color(0xFF151515), 
    onBackground: Color(0xFFFFFFFF), 
  )
);