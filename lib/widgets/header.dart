import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:youtube_to_mp3_v2/widgets/logo.dart';
import 'package:youtube_to_mp3_v2/widgets/window_buttons.dart';

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
          const SizedBox(width: 10),
          const Text("YouTube To Mp3"),
          Expanded(child: MoveWindow()),
          const WindowButtons()
        ],
      ),
    );
  }
}
