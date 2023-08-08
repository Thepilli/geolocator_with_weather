import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const jPrimaryColor = Color(0xFF8669A6);
  static const jSecondaryColor = Color(0xFFAD98C5);
  static const jAccentColor = Color(0xFF001BFF);
  static const jCardBgColor = Color(0xffffdcbd);

  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const completed = Color.fromARGB(255, 28, 88, 30);
  static const notCompleted = Color.fromARGB(255, 210, 32, 19);
  static const textLightColor = Colors.white70;
  static const textDarkColor = Color(0xFF311A36);

  static const lightBgdark = Color(0xFFB19CD7);
  static const lightBg = Color(0xFFCEC2EB);
  static const lightBglight = Color(0xFFEBE8FC);
  static const darkBgdark = Color(0xFFE9B412);
  static const darkBg = Color(0xFFF7CB42);
  static const darkBglight = Color(0xFFFFE491);

  static const colors = [
    Colors.red,
    Colors.white,
    Colors.yellow,
    Colors.green,
    Color(0xFFABB2BF),
  ];

  static const red = Colors.red;
  static const blue = Colors.blue;
  static const yellow = Colors.yellow;
  static const green = Colors.green;
  static const grey = Color(0xFFABB2BF);

  static Color randomColor() {
    final random = Random();
    int randomIndex = random.nextInt(AppColors.colors.length);
    return AppColors.colors[randomIndex];
  }
}
