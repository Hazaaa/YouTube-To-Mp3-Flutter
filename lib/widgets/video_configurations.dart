import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
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
                backgroundColor: Colors.red,
                disabledBackgroundColor: ThemeConstants.thirdColor),
            onPressed: store.convertingInProgress
                ? null
                : () {
                    try {
                      store.convert();
                    } on MissingFfmpegException catch (_) {
                      showMissingFfmpegDialog(context, store);
                    }
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
          SizedBox(width: screenWidth * 0.21),
          AnimatedOpacity(
            opacity: store.convertingInProgress ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: const SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                strokeWidth: 6.0,
                color: Colors.red,
              ),
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
          SizedBox(width: screenWidth * 0.17),
          AnimatedOpacity(
            opacity: store.currentConvertingStep.isNotEmpty ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Text(store.currentConvertingStep),
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
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: const Text('Did you forgot Ffmpeg?'),
          content: const Text(
              "To convert YouTube videos to mp3 we are using app called ffmpeg, and it seems that it's not installed on your machine.\nDo you want to install it?"),
          actions: [
            TextButton(
              onPressed: () {
                store.convertingInProgress = true;
                store.currentConvertingStep = 'Downloading ffmpeg...';
                Process.run('winget', ['install', 'ffmpeg'], runInShell: true)
                    .then(
                  (process) {
                    store.convertingInProgress = false;
                    store.currentConvertingStep = process.exitCode == 0
                        ? ''
                        : 'Error happend while trying to install ffmpeg...';
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                store.convertingInProgress = false;
                store.currentConvertingStep = 'Missing ffmpeg!';
              },
              child: const Text("No"),
            )
          ],
        );
      },
    );
  }
}
