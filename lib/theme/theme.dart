import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

final ThemeData customTheme = ThemeData(
  scaffoldBackgroundColor: ThemeConstants.primaryColor,
  colorScheme: const ColorScheme.light(),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ThemeConstants.inputCursorColor,
    selectionColor: ThemeConstants.secondaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
    backgroundColor:
        MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return ThemeConstants.buttonDisableColor;
      } else {
        return ThemeConstants.buttonBackgroundColor;
      }
    }),
  )),
  textTheme: const TextTheme(
    bodyLarge: ThemeConstants.textMainStyle,
    bodyMedium: ThemeConstants.textMainStyle,
    labelLarge: ThemeConstants.textMainStyle,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: ThemeConstants.inputFillColor,
    focusColor: ThemeConstants.secondaryColor,
    contentPadding: ThemeConstants.inputContentPadding,
    iconColor: ThemeConstants.iconColor,
    labelStyle: TextStyle(color: ThemeConstants.errorColor),
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
