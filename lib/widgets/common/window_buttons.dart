import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonsColors =
        WindowButtonColors(iconNormal: ThemeConstants.iconColor);

    final closeButtonColors = WindowButtonColors(
        iconNormal: ThemeConstants.errorColor,
        mouseOver: ThemeConstants.errorColor,
        iconMouseOver: ThemeConstants.iconColor);

    return Row(
      children: [
        MinimizeWindowButton(colors: buttonsColors),
        CloseWindowButton(colors: closeButtonColors)
      ],
    );
  }
}
