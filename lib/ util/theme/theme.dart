import 'package:coindock_app/%20util/constants/colors.dart';
import 'package:coindock_app/%20util/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
// import 'custom_themes/elevated_button_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    textTheme: CTextTheme.lightTextTheme,
    // elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
  );
}