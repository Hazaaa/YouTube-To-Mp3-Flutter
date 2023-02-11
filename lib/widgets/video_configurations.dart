import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class VideoConfigurations extends StatelessWidget {
  const VideoConfigurations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final size = MediaQuery.of(context).size;

    final leftMargine = size.width * 0.02;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: size.width * 0.17),
            const Text(
              "Configuration:",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Observer(
          builder: (_) => Row(
            children: [
              SizedBox(width: leftMargine),
              const Text("Save path:"),
              SizedBox(width: leftMargine),
              IconButton(
                icon: const Icon(Icons.highlight_alt_rounded),
                color: Colors.red,
                tooltip:
                    "Select save path where your audio will be saved.\n*Default path is 'Documents' folder",
                onPressed: () async {
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
        ),
        const SizedBox(height: 20.0),
        Observer(
          builder: (_) => Row(
            children: [
              SizedBox(width: leftMargine),
              const Text("Save video:"),
              SizedBox(width: leftMargine),
              Tooltip(
                message:
                    "Video is temporary saved just so audio is extracted.\nIf you want to keep the video too, check this checkbox.",
                child: Checkbox(
                    focusColor: Colors.white,
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                    hoverColor: ThemeConstants.secondaryColor,
                    splashRadius: 0,
                    side: const BorderSide(color: Colors.white, width: 2),
                    value: store.saveVideoAlso,
                    onChanged: (bool? value) => store.saveVideoAlso = value!),
              ),
              SizedBox(width: leftMargine)
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Observer(
          builder: (_) => Row(
            children: [
              SizedBox(width: size.width * 0.17),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 0, right: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.swap_vert_sharp),
                      Container(
                        margin: const EdgeInsets.only(left: 5, bottom: 2),
                        child: const Text("Convert"),
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  store.convert();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
