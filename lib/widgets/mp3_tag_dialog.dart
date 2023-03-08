import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:youtube_to_mp3_v2/models/mp3_tag.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class Mp3TagDialog extends StatelessWidget {
  const Mp3TagDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final titleTextController = TextEditingController(text: store.tag?.title);
    final authorTextController = TextEditingController(text: store.tag?.author);
    final albumTextController = TextEditingController(text: store.tag?.album);
    final genreTextController = TextEditingController(text: store.tag?.genre);

    return Observer(
      builder: (_) => AlertDialog(
        title: const Text("Add Mp3 tag details:",
            style: ThemeConstants.textMainStyle),
        backgroundColor: ThemeConstants.secondaryColor,
        content: SizedBox(
          width: 500,
          height: 255,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedImage = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                    dialogTitle: 'Pick album cover image',
                  );

                  if (pickedImage != null && pickedImage.files.isNotEmpty) {
                    store.tag = store.tag!.setAlbumCover(
                      File(pickedImage.files.first.path!),
                    );
                  }
                },
                child: store.tag?.albumCoverImage != null
                    ? Image.file(
                        store.tag!.albumCoverImage!,
                        width: 200,
                        height: 200,
                      )
                    : Image.asset(
                        'assets/DefaultSongCover.jpg',
                        width: 200,
                        height: 200,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(children: [
                  TextField(
                    controller: titleTextController,
                    autofocus: true,
                    style: ThemeConstants.textMainStyle,
                    decoration: const InputDecoration(
                        labelText: 'Title:', hintText: 'Add song title...'),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: authorTextController,
                    style: ThemeConstants.textMainStyle,
                    decoration: const InputDecoration(
                        labelText: 'Author:', hintText: 'Add song author...'),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: albumTextController,
                    style: ThemeConstants.textMainStyle,
                    decoration: const InputDecoration(
                        labelText: 'Album:', hintText: 'Add song album...'),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: genreTextController,
                    style: ThemeConstants.textMainStyle,
                    decoration: const InputDecoration(
                        labelText: 'Genre:', hintText: 'Add song genre...'),
                  )
                ]),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              final newTag = Mp3Tag(
                  title: titleTextController.text,
                  author: authorTextController.text,
                  album: albumTextController.text,
                  genre: genreTextController.text,
                  albumCoverImage: store.tag?.albumCoverImage);
              store.tag = newTag;
            },
            child: const Text("Save", style: ThemeConstants.textMainStyle),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel", style: ThemeConstants.textMainStyle),
          )
        ],
      ),
    );
  }
}
