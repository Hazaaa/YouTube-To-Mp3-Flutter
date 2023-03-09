// Pub.dev packages
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Project packages
import 'package:youtube_to_mp3_v2/pages/home.dart';
import 'package:youtube_to_mp3_v2/providers/services_provider.dart';
import 'package:youtube_to_mp3_v2/providers/store_provider.dart';
import 'package:youtube_to_mp3_v2/theme/theme.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';
import 'package:youtube_to_mp3_v2/widgets/footer.dart';
import 'package:youtube_to_mp3_v2/widgets/header.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    win.minSize = ConfigurationConstants.initialApplicationSize;
    win.maxSize = ConfigurationConstants.initialApplicationSize;
    win.size = ConfigurationConstants.initialApplicationSize;
    win.alignment = ConfigurationConstants.initialApplicationAlignment;
    win.title = ConfigurationConstants.applicationTitle;
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...ServicesProvider.provideRequiredServices(),
        StoreProvider.provideStore()
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ConfigurationConstants.applicationTitle,
        theme: customTheme,
        home: Scaffold(
          body: WindowBorder(
            color: ThemeConstants.secondaryColor,
            width: ThemeConstants.borderWindowSize,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: const [
                  Header(),
                  Expanded(
                    child: HomePage(),
                  ),
                  Footer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
