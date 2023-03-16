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
    final albumArtistTextController = TextEditingController(
        text: (store.tag?.albumArtist != null && store.tag?.albumArtist != "")
            ? store.tag?.albumArtist
            : store.tag?.author);
    final yearTextController = TextEditingController(text: store.tag?.year);
    final genreTextController = TextEditingController(text: store.tag?.genre);

    return Observer(
      builder: (_) => AlertDialog(
        title: const Text(
          "Add Mp3 tag details:",
          style: ThemeConstants.textMainStyle,
        ),
        backgroundColor: ThemeConstants.secondaryColor,
        content: SizedBox(
          width: 500,
          height: 395,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  await _pickAlbumCover(store);
                },
                child: _getAlbumCoverImage(store),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(children: [
                  _getInputTextField(
                      textController: titleTextController,
                      label: 'Title:',
                      hint: 'Add song title...',
                      focus: true),
                  const SizedBox(height: 20.0),
                  _getInputTextField(
                      textController: authorTextController,
                      label: 'Artist(s):',
                      hint: 'Add song artist(s)...'),
                  const SizedBox(height: 20.0),
                  _getInputTextField(
                      textController: albumArtistTextController,
                      label: 'Album artist(s):',
                      hint: 'Add album artist(s)...'),
                  const SizedBox(height: 20.0),
                  _getInputTextField(
                      textController: albumTextController,
                      label: 'Album:',
                      hint: 'Add song album...'),
                  const SizedBox(height: 20.0),
                  _getInputTextField(
                      textController: yearTextController,
                      label: 'Year:',
                      hint: 'Add song year...'),
                  const SizedBox(height: 20.0),
                  _getInputTextField(
                      textController: genreTextController,
                      label: 'Genre:',
                      hint: 'Add song genre...')
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
                  albumArtist: albumArtistTextController.text,
                  genre: genreTextController.text,
                  albumCoverImage: store.tag?.albumCoverImage,
                  year: yearTextController.text);
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

  /// Gets TextField widget with provided text controller, label and hint.
  TextField _getInputTextField(
      {required TextEditingController textController,
      required String label,
      required String hint,
      bool focus = false}) {
    return TextField(
      controller: textController,
      autofocus: focus,
      style: ThemeConstants.textMainStyle,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }

  /// Gets Image widget for Album cover if it's set, otherwise returns default song cover.
  Image _getAlbumCoverImage(MainStore store) {
    return store.tag?.albumCoverImage != null
        ? Image.file(
            store.tag!.albumCoverImage!,
            width: 200,
            height: 200,
          )
        : Image.asset(
            'assets/DefaultSongCover.jpg',
            width: 200,
            height: 200,
          );
  }

  /// Picks album cover using file picker package.
  Future<void> _pickAlbumCover(MainStore store) async {
    final pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.image,
      dialogTitle: 'Pick album cover image',
    );

    if (pickedImage != null && pickedImage.files.isNotEmpty) {
      store.tag = store.tag!.setAlbumCover(
        File(pickedImage.files.first.path!),
      );
    }
  }
}
