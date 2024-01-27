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
  textTheme: textStyleData,

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
  textTheme: textStyleData,

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

const textStyleData =  TextTheme(
  /// This is LargeTitle, which can be used with bold font weight.
  displayLarge: TextStyle(
    fontSize: 34,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Title1, which can be used with bold font weight.
  titleLarge: TextStyle(
    fontSize: 28,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Title2, which can be used with bold font weight.
  titleMedium: TextStyle(
    fontSize: 22,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Title3, which can be used with a bold font weight.
  titleSmall: TextStyle(
    fontSize: 20,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Headline, which can be used with italic font style.
  headlineLarge: TextStyle(
    fontSize: 17,
    fontWeight: ThemeFontWeights.bold,
  ),

  /// This is Body, which can be used with bold font weight and italic font style.
  bodyLarge: TextStyle(
    fontSize: 17,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Caption1, which can be used with bold font weight and italic font style.
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: ThemeFontWeights.regular,
  ),

  /// This is Caption2, which can be used with bold font weight and italic font style.
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: ThemeFontWeights.regular,
  ),
);

class ThemeFontWeights {
  /// Thin, the least thick.
  static const FontWeight ultralight = FontWeight.w100;

  /// Extra-light.
  static const FontWeight thin = FontWeight.w200;

  /// Light.
  static const FontWeight light = FontWeight.w300;

  /// The default font weight.
  static const FontWeight regular = FontWeight.w400;

  /// Medium.
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold.
  static const FontWeight semibold = FontWeight.w600;

  /// A commonly used font weight that is heavier than normal.
  static const FontWeight bold = FontWeight.w700;

  /// Extra-bold.
  static const FontWeight heavy = FontWeight.w800;

  /// Black, the most thick.
  static const FontWeight black = FontWeight.w900;
}