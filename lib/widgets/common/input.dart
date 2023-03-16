import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class Input extends StatelessWidget {
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final inputTextController = TextEditingController(text: store.videoUrl);

    return Observer(
      builder: (_) => TextField(
        enabled: !store.videoMetadataDownloadingInProgress &&
            !store.convertingInProgress,
        controller: inputTextController,
        style: const TextStyle(
            color: ThemeConstants.inputTextColor,
            backgroundColor: Colors.transparent),
        cursorColor: ThemeConstants.inputCursorColor,
        decoration: InputDecoration(
          errorText: store.error.isEmpty ? null : store.error,
          hintText: 'Paste YouTube or YouTube Music link',
          prefixIcon: store.videoUrl.isNotEmpty
              ? IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(Icons.cancel_outlined),
                  tooltip: 'Clear',
                  onPressed: () {
                    store.clearInput();
                    inputTextController.clear();
                  },
                )
              : null,
        ),
        onChanged: (String value) {
          store.setVideoUrl(value);
          if (store.error.isEmpty) {
            store.getVideoMetadata();
          }
        },
      ),
    );
  }
}
