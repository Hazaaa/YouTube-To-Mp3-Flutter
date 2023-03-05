import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:youtube_to_mp3_v2/exceptions/converting_exception.dart';
import 'package:youtube_to_mp3_v2/exceptions/missing_ffmpeg_exception.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class VideoConfigurations extends StatelessWidget {
  const VideoConfigurations({Key? key}) : super(key: key);

  /// Returning row with configuration label.
  Row configurationLabelWidget(double screenWidth) {
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.17),
        const Text(
          "Configuration:",
          style: TextStyle(fontSize: 20.0),
        )
      ],
    );
  }

  Observer pathSelectorWidget(MainStore store, double leftMargine) {
    return Observer(
      builder: (_) => Row(
        children: [
          SizedBox(width: leftMargine),
          const Text("Save path:"),
          SizedBox(width: leftMargine),
          IconButton(
            icon: const Icon(Icons.highlight_alt_rounded),
            color: Colors.red,
            disabledColor: ThemeConstants.thirdColor,
            tooltip:
                "Select save path where your audio will be saved.\n*Default path is 'Documents' folder",
            onPressed: store.convertingInProgress
                ? null
                : () async {
                    String? selectedDirectory =
                        await FilePicker.platform.getDirectoryPath();

                    if (selectedDirectory != null) {
                      store.savePath = selectedDirectory;
                    }
                  },
          ),
          SizedBox(width: leftMargine),
          Text(
            store.savePath.isEmpty ? "" : store.savePath,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Observer saveVideoCheckboxWidget(MainStore store, double leftMargine) {
    return Observer(
      builder: (_) => Row(
        children: [
          SizedBox(width: leftMargine),
          const Text("Save video:"),
          SizedBox(width: leftMargine),
          Tooltip(
            message:
                "Video is temporary saved just to extract audio.\nIf you want to keep the video too, check this checkbox.",
            child: Checkbox(
                focusColor: Colors.white,
                activeColor: Colors.red,
                checkColor: Colors.white,
                hoverColor: ThemeConstants.secondaryColor,
                splashRadius: 0,
                side: const BorderSide(color: Colors.white, width: 2),
                value: store.saveVideoAlso,
                onChanged: store.convertingInProgress
                    ? null
                    : (bool? value) => store.saveVideoAlso = value!),
          ),
          SizedBox(width: leftMargine)
        ],
      ),
    );
  }

  Observer convertButtonWidget(
      BuildContext context, MainStore store, double screenWidth) {
    return Observer(
      builder: (_) => Row(
        children: [
          SizedBox(width: screenWidth * 0.17),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: store.convertingInProgress
                  ? ThemeConstants.thirdColor
                  : Colors.red,
            ),
            onPressed: () {
              if (store.convertingInProgress) {
                return;
              }

              store.convert().then(
                (result) {
                  if (!result.succesfull) {
                    if (result.exception is MissingFfmpegException) {
                      showMissingFfmpegDialog(context, store);
                      return;
                    }

                    if (result.exception is ConvertingException) {
                      showConvertingErrorDialog(
                          context, store, result.exception.toString());
                    }
                  }
                },
              );
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.swap_vert_sharp),
                  Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 2),
                    child: const Text("Convert"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Observer convertingProgressIndicatorWidget(
      MainStore store, double screenWidth) {
    return Observer(
      builder: (_) => Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth * 0.05),
            width: screenWidth * 0.4,
            height: 10,
            child: LinearProgressIndicator(
              value: store.convertProggressPrecentage,
              backgroundColor: ThemeConstants.secondaryColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  ThemeConstants.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  Observer convertingCurrentStepWidget(MainStore store, double screenWidth) {
    return Observer(
      builder: (_) => Row(
        children: [
          SizedBox(width: screenWidth * 0.16),
          AnimatedOpacity(
            opacity: store.convertCurrentStep.isNotEmpty ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Text(store.convertCurrentStep),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final size = MediaQuery.of(context).size;

    final leftMargine = size.width * 0.02;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        configurationLabelWidget(size.width),
        const SizedBox(height: 20.0),
        pathSelectorWidget(store, leftMargine),
        const SizedBox(height: 20.0),
        saveVideoCheckboxWidget(store, leftMargine),
        const SizedBox(height: 20.0),
        convertButtonWidget(context, store, size.width),
        const SizedBox(height: 40.0),
        convertingProgressIndicatorWidget(store, size.width),
        const SizedBox(height: 20.0),
        convertingCurrentStepWidget(store, size.width)
      ],
    );
  }

  void showMissingFfmpegDialog(BuildContext context, MainStore store) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: const Text('Did you forgot Ffmpeg?',
              style: ThemeConstants.mainTextStyle),
          content: const Text(
              "To convert YouTube videos to mp3 we are using app called ffmpeg, and it seems that it's not installed on your machine.\nDo you want to install it?",
              style: ThemeConstants.mainTextStyle),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
              onPressed: () {
                store.convertingInProgress = true;
                store.convertCurrentStep = 'Downloading ffmpeg...';
                Process.run('winget', ['install', 'ffmpeg'], runInShell: true)
                    .then(
                  (process) {
                    store.convertingInProgress = false;
                    store.convertCurrentStep = process.exitCode == 0
                        ? ''
                        : 'Error happend while trying to install ffmpeg...';
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text("Yes"),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                store.convertingInProgress = false;
                store.convertCurrentStep = 'Missing ffmpeg!';
              },
              child: const Text("No"),
            )
          ],
          backgroundColor: ThemeConstants.secondaryColor,
        );
      },
    );
  }

  void showConvertingErrorDialog(
      BuildContext context, MainStore store, String convertErrorMessage) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Converting error :(",
              style: ThemeConstants.mainTextStyle),
          content:
              Text(convertErrorMessage, style: ThemeConstants.mainTextStyle),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                store.convertingInProgress = false;
                store.convertCurrentStep = '';
                store.convertProggressPrecentage = 0.0;
              },
              child: const Text("Ok", style: ThemeConstants.mainTextStyle),
            )
          ],
          backgroundColor: ThemeConstants.secondaryColor,
        );
      },
    );
  }
}
