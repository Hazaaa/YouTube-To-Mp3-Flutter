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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Observer(
        builder: (_) => TextField(
          enabled: !store.convertingInProgress,
          controller: inputTextController,
          style: const TextStyle(
            color: ThemeConstants.inputTextColor,
            backgroundColor: Colors.transparent,
          ),
          cursorColor: ThemeConstants.inputCursorColor,
          decoration: InputDecoration(
            hintText: 'Paste YouTube or YouTube Music link',
            prefixIcon: store.videoUrl.isNotEmpty
                ? IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: () {
                      store.videoUrl = '';
                      inputTextController.clear();
                    },
                  )
                : null,
            suffixIcon: Container(
              height: 46,
              margin: const EdgeInsets.only(right: 1),
              padding: const EdgeInsets.only(right: 12, left: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                border: Border.all(
                    width: 0.5, color: ThemeConstants.inputBorderColor),
                color: ThemeConstants.secondaryColor,
              ),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(Icons.autorenew_rounded),
                onPressed: () {
                  if (store.videoUrl.isNotEmpty) {
                    store.convert();
                  }
                },
              ),
            ),
          ),
          onChanged: (String value) => {store.videoUrl = value},
        ),
      ),
    );
  }
}
