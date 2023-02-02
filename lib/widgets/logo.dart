import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';
import 'package:youtube_to_mp3_v2/widgets/painters/triangle.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 20.0, right: 17.0, top: 7.0, bottom: 9.0),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeConstants.borderColor),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: CustomPaint(painter: Triangle(), size: const Size(15, 15)),
    );
  }
}
