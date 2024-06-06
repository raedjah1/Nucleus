import 'package:flutter/material.dart';
import 'package:nucleus/shared/themes/constants.dart';
import 'package:nucleus/shared/themes/text_theme.dart';

final darkTheme = _darkTheme();

ThemeData _darkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: backgroundColorDark,
    primaryColor: primaryColorDark,
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      surface: surfaceColorDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: primaryColorDark,
      elevation: 1,
      systemOverlayStyle: base.appBarTheme.systemOverlayStyle,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: textTheme(base.textTheme),
  );
}
