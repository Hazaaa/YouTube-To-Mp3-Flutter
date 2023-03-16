import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

                if (await canLaunchUrlString(gitHubIssuesNewUrl)) {
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
                const gitHubUrl = 'https://github.com/Hazaaa/YouTube-To-Mp3-v2';

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
                const mediumUrl = 'https://medium.com/@stefanacimovicMEng';

                if (await canLaunchUrlString(mediumUrl)) {
                  await launchUrlString(mediumUrl);
                }
              },
            ),
            const SizedBox(width: 15)
          ],
        )
      ],
    );
  }
}
