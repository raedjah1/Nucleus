import 'package:flutter/material.dart';
import 'package:nucleus/shared/themes/constants.dart';

final ThemeData lightTheme = _lightTheme();

ThemeData _lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: backgroundColorLight,
    primaryColor: primaryColorLight,
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColorLight,
      secondary: secondaryColorLight,
      surface: backgroundColorLight,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.black,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: primaryColorLight,
      elevation: 1,
      systemOverlayStyle: base.appBarTheme.systemOverlayStyle,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
