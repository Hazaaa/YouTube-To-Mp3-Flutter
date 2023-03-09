import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_to_mp3_v2/pages/home.dart';
import 'package:youtube_to_mp3_v2/services/convert_service.dart';
import 'package:youtube_to_mp3_v2/services/download_and_convert_service_wrapper.dart';
import 'package:youtube_to_mp3_v2/services/download_service.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';
import 'package:youtube_to_mp3_v2/widgets/header.dart';

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
      providers: [
        Provider<DownloadAndConvertServicesWrapper>(
          create: (_) => DownloadAndConvertServicesWrapper(
            convertService: ConvertService(),
            downloadService: DownloadService(),
          ),
        ),
        ProxyProvider<DownloadAndConvertServicesWrapper, MainStore>(
          update: (_, downloadAndConvertServicesWrapper, __) =>
              MainStore(downloadAndConvertServicesWrapper),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YouTube To Mp3',
          theme: customTheme,
          home: Scaffold(
            body: WindowBorder(
              color: ThemeConstants.secondaryColor,
              width: ThemeConstants.borderWindowSize,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Header(),
                  const Expanded(
                    child: HomePage(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          IconButton(
                            tooltip:
                                'Found a bug or you have a suggestion?\nPlease create issue in the GitHub repo and try it to explain as much as you can.\nThank you!',
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const FaIcon(
                              FontAwesomeIcons.bugs,
                              color: ThemeConstants.fourthColor,
                            ),
                            onPressed: () async {
                              const gitHubIssuesNewUrl =
                                  'https://github.com/Hazaaa/YouTube-To-Mp3-v2/issues/new';

                              if (await canLaunchUrlString(
                                  gitHubIssuesNewUrl)) {
                                await launchUrlString(gitHubIssuesNewUrl);
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            tooltip:
                                'If you like the project give it a star and follow it on GitHub :)',
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const FaIcon(
                              FontAwesomeIcons.github,
                              color: ThemeConstants.fourthColor,
                            ),
                            onPressed: () async {
                              const gitHubUrl =
                                  'https://github.com/Hazaaa/YouTube-To-Mp3-v2';

                              if (await canLaunchUrlString(gitHubUrl)) {
                                await launchUrlString(gitHubUrl);
                              }
                            },
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            tooltip: 'You can follow me on Medium :)',
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const FaIcon(
                              FontAwesomeIcons.medium,
                              color: ThemeConstants.fourthColor,
                            ),
                            onPressed: () async {
                              const mediumUrl =
                                  'https://medium.com/@stefanacimovicMEng';

                              if (await canLaunchUrlString(mediumUrl)) {
                                await launchUrlString(mediumUrl);
                              }
                            },
                          ),
                          const SizedBox(width: 15)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
