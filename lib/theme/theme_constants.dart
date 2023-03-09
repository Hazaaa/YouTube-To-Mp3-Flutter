import 'package:flutter/material.dart';

class ConfigurationConstants {
  static const String applicationTitle = "YouTube To Mp3";
  static const Size initialApplicationSize = Size(800, 600);
  static const Alignment initialApplicationAlignment = Alignment.center;
}

class ThemeConstants {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 15, 15, 15);
  static const Color secondaryColor = Color.fromARGB(255, 34, 34, 34);
  static const Color thirdColor = Colors.grey;
  static const Color fourthColor = Colors.white;
  static const Color fifthColor = Colors.red;

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
  static const double textFontSize = 16;
  static const TextStyle textMainStyle = TextStyle(
      color: fourthColor, fontSize: textFontSize, overflow: TextOverflow.clip);
  static const TextStyle textDetailNameStyle =
      TextStyle(fontWeight: FontWeight.bold, color: fifthColor);

  // Button
  static const Color buttonBackgroundColor = fifthColor;
  static const Color buttonDisableColor = thirdColor;

  // Icon
  static const Color iconColor = fourthColor;
  static const Color iconSuccessfulColor = Colors.green;

  // Border
  static const double borderWindowSize = 2;
  static const Color borderColor = secondaryColor;

  // Error
  static const Color errorColor = fifthColor;
}
