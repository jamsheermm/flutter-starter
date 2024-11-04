import 'package:flutter/material.dart';

import '../core/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kYellowColor),
    primaryColor: kLightYellowColor,
    useMaterial3: true,
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            color: kBlackColor, fontWeight: FontWeight.w600, fontSize: 16),
        bodyMedium: TextStyle(
            color: kBlackColor, fontWeight: FontWeight.w500, fontSize: 16),
        bodySmall: TextStyle(
            color: kBlackColor, fontWeight: FontWeight.w400, fontSize: 12),
        bodyLarge: TextStyle(
            color: kBlackColor, fontWeight: FontWeight.w700, fontSize: 18),
        displayLarge: TextStyle(
            color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            color: kWhiteColor, fontWeight: FontWeight.w600, fontSize: 14)),
  );
}
