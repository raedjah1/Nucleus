import 'package:flutter/material.dart';

TextTheme textTheme(TextTheme base) => base.copyWith(
      headlineLarge: base.headlineLarge!.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: base.headlineMedium!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: base.headlineSmall!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: base.titleMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: base.titleSmall!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: base.labelLarge!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: base.labelMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: base.labelSmall!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: base.displayLarge!.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: base.displayMedium!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: base.displaySmall!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
