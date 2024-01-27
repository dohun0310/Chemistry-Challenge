import 'package:flutter/material.dart';

import 'package:chemistry_challenge/themes/main.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).extension<ThemeColors>()?.onBackground,
      ),
    ),
    elevation: 0,
  );
}