import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_to_mp3_v2/pages/home.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';
import 'package:youtube_to_mp3_v2/widgets/header.dart';

// Instatiate the store
final appStore = MainStore();

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "YouTube To Mp3";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<MainStore>(create: (_) => MainStore())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YouTube To Mp3',
          theme: customTheme,
          home: Scaffold(
            body: WindowBorder(
              color: ThemeConstants.secondaryColor,
              width: ThemeConstants.windowBorderSize,
              child: Column(
                children: const [SizedBox(height: 8), Header(), HomePage()],
              ),
            ),
          )),
    );
  }
}
