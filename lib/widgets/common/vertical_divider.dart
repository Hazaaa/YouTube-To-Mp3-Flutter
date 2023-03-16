import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 1,
      height: size.height,
      color: ThemeConstants.secondaryColor,
    );
  }
}
