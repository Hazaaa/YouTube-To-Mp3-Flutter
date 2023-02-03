import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: ThemeConstants.primaryColor,
  colorScheme: const ColorScheme.light(),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ThemeConstants.inputCursorColor,
    selectionColor: ThemeConstants.secondaryColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: ThemeConstants.whiteTextStyle,
    bodyMedium: ThemeConstants.whiteTextStyle,
    labelLarge: ThemeConstants.whiteTextStyle,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ThemeConstants.inputFillColor,
    focusColor: ThemeConstants.secondaryColor,
    contentPadding: ThemeConstants.inputContentPadding,
    iconColor: ThemeConstants.iconColor,
    hintStyle: TextStyle(color: ThemeConstants.inputHintTextColor),
    suffixIconColor: ThemeConstants.iconColor,
    prefixIconColor: ThemeConstants.thirdColor,
    border: OutlineInputBorder(
      borderRadius: ThemeConstants.inputBorderRadius,
      borderSide: BorderSide(
          width: ThemeConstants.inputBorderSize,
          color: ThemeConstants.inputBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: ThemeConstants.inputBorderRadius,
      borderSide: BorderSide(
          width: ThemeConstants.inputBorderSize,
          color: ThemeConstants.inputBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: ThemeConstants.inputBorderRadius,
      borderSide: BorderSide(
          width: ThemeConstants.inputBorderSize,
          color: ThemeConstants.inputBorderColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: ThemeConstants.inputBorderRadius,
      borderSide: BorderSide(
          width: ThemeConstants.inputBorderSize,
          color: ThemeConstants.secondaryColor),
    ),
  ),
);
