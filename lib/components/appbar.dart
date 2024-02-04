import 'package:flutter/material.dart';

import 'package:chemistry_challenge/theme.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: ThemeTexts.title2Regular.copyWith(
        color: Theme.of(context).extension<AppExtension>()!.colors.text,
      ),
    ),
    elevation: 0,
    backgroundColor: Theme.of(context).extension<AppExtension>()!.colors.background,
  );
}