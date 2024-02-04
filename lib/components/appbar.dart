import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: ThemeTexts.title2Regular,
    ),
    elevation: 0,
  );
}