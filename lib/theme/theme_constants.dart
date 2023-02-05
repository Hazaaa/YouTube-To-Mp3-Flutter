import 'package:flutter/material.dart';

class ThemeConstants {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 15, 15, 15);
  static const Color secondaryColor = Color.fromARGB(255, 34, 34, 34);
  static const Color thirdColor = Colors.grey;
  static const Color fourthColor = Colors.white;
  static const Color borderColor = secondaryColor;
  static const Color errorColor = Colors.red;
  static const Color iconColor = fourthColor;

  // Sizes
  static const double windowBorderSize = 2;
  static const double textFontSize = 16;
  static const double detailsHorizontalSpacing = 15;

  // Input
  static const Color inputTextColor = fourthColor;
  static const Color inputFillColor = Color.fromARGB(255, 18, 18, 18);
  static const Color inputHintTextColor = thirdColor;
  static const Color inputBorderColor = thirdColor;
  static const double inputBorderSize = 1;
  static const BorderRadius inputBorderRadius =
      BorderRadius.all(Radius.circular(35.0));
  static const EdgeInsets inputContentPadding =
      EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  static const Color inputCursorColor = fourthColor;

  // Text
  static const TextStyle mainTextStyle = TextStyle(
      color: fourthColor, fontSize: textFontSize, overflow: TextOverflow.clip);
  static const TextStyle detailNameTextStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
}
