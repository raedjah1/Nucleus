import 'package:flutter/material.dart';
import 'package:nucleus/shared/themes/constants.dart';
import 'package:nucleus/shared/themes/text_theme.dart';

final ThemeData lightTheme = _lightTheme();

ThemeData _lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: backgroundColorLight,
    primaryColor: primaryColorLight,
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColorLight,
      secondary: secondaryColorLight,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
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
    textTheme: textTheme(base.textTheme),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      prefixIconColor: primaryColorLight,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      filled: true,
      fillColor: base.colorScheme.shadow.withOpacity(0.075),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.5,
        foregroundColor: Colors.white,
        backgroundColor: primaryColorLight,
        fixedSize: const Size(300, 40),
      ),
    ),
  );
}
