import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'package:youtube_to_mp3_v2/widgets/common/logo.dart';
import 'package:youtube_to_mp3_v2/widgets/common/window_buttons.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 30),
          const Logo(),
          const SizedBox(width: 13),
          Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text("YouTube To Mp3")),
          Expanded(child: MoveWindow()),
          const WindowButtons()
        ],
      ),
    );
  }
}
