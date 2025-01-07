import 'package:flutter/material.dart';

final class AppTheme {
  // Colors Defined
  static const primaryColor = Colors.white;
  static const blueColor = Color(0xff007FFF);
  static const greyColor = Color(0xFF8D9CB8);
  static const cardColor = Color(0xFFf5F7F9);
  static const redColor = Color(0xffFF5E5E);

  // Text Styles
  static TextStyle get textTitle => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Urbanist',
        fontSize: 18,
      );

  static TextStyle get textBold => const TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Urbanist',
        fontSize: 22,
      );

  static TextStyle get textNormal => const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Urbanist',
        color: greyColor,
        fontSize: 18,
      );

  // Ligth Theme
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    useMaterial3: true,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: textTitle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      fillColor: Colors.grey.shade300,
      errorStyle: const TextStyle(
        color: greyColor,
        fontWeight: FontWeight.w500,
      ),
      focusColor: greyColor,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: greyColor,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}


/*
  // Styles Text
  static const titleStyle = TextStyle(
    color: whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const titlePrimaryStyle = TextStyle(
    color: primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: 'Urbanist',
  );

  static const titleSmallStyle = TextStyle(
    color: whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Urbanist',
  );

  static const titleSmallPrimaryStyle = TextStyle(
    color: primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Urbanist',
  );

  static const subTitleSmallStyle = TextStyle(
    color: whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: 'Urbanist',
  );

  static const textPrimaryStyle = TextStyle(
    color: primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Urbanist',
  );

  static const textYellowStyle = TextStyle(
    color: yellowColor,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Urbanist',
  );

  
*/
