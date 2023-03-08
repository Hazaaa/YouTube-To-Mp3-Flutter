import 'dart:io';

import 'package:youtube_to_mp3_v2/exceptions/applying_tags_exception.dart';
import 'package:youtube_to_mp3_v2/exceptions/converting_exception.dart';
import 'package:youtube_to_mp3_v2/models/mp3_tag.dart';
import 'package:path/path.dart' as path;

class ConvertService {
  /// Converts Mp4 to Mp3 using ffmpeg cli through PowerShell.
  ///
  /// [pathToMp4] - full path to Mp4 file.
  /// [mp3SavePath] - save path for the new Mp3 file with name and extension.
  Future<void> convertMp4ToMp3(String pathToMp4, String mp3SavePath) async {
    final ffmpegArguments = [
      '-i',
      pathToMp4,
      '-vn',
      '-ac',
      '2',
      '-b:a',
      '192k', // Valid bitrates: 8k|16k|24k|32k|40k|48k|64k|80k|96k|112k|128k|160k|192k|224k|256k|320k
      mp3SavePath
    ];

    final process =
        await Process.run('ffmpeg', ffmpegArguments, runInShell: true);

    if (process.exitCode == 0) {
      // Removing temporary mp4 file.
      await File(pathToMp4).delete();
    } else {
      throw ConvertingException();
    }
  }

  /// Applys provided tags to Mp3 which path is provided.
  ///
  /// [mp3Path] - Full path to the Mp3 file to which tag will be applied.
  /// [tag] - Mp3Tag object with all tag related data.
  Future<void> applyTagsToMp3(String mp3Path, Mp3Tag? tag) async {
    // It's required to give ffmpeg args like this because of Process.run takes them like that.
    // Starting ffmpeg arguments with path to the Mp3 file.
    final ffmpegArguments = ['-i', mp3Path];

    if (tag == null) {
      return;
    }

    if (tag.albumCoverImage != null) {
      ffmpegArguments.addAll(
        [
          '-i',
          tag.albumCoverImage!.path,
          '-map',
          '0',
          '-map',
          '1',
          '-c',
          'copy',
          '-id3v2_version',
          '3',
          '-metadata:s:v',
          'title="Album cover"',
          '-metadata:s:v',
          'comment="Cover (front)"'
        ],
      );
    }

    if (tag.title != null && tag.title!.isNotEmpty) {
      ffmpegArguments.addAll(
        ['-metadata', 'title=${tag.title}'],
      );
    }

    if (tag.author != null && tag.author!.isNotEmpty) {
      ffmpegArguments.addAll(
        ['-metadata', 'author=${tag.author}'],
      );
    }

    if (tag.album != null && tag.album!.isNotEmpty) {
      ffmpegArguments.addAll(
        ['-metadata', 'album=${tag.album}'],
      );
    }

    if (tag.genre != null && tag.genre!.isNotEmpty) {
      ffmpegArguments.addAll(
        ['-metadata', 'genre=${tag.genre}'],
      );
    }

    String outputMp3FilePath = mp3Path;
    if (tag.author != null && tag.title != null) {
      outputMp3FilePath =
          '${path.dirname(mp3Path)}\\${tag.author} - ${tag.title}.mp3';
    }

    ffmpegArguments.add(outputMp3FilePath);

    final process =
        await Process.run('ffmpeg', ffmpegArguments, runInShell: true);

    if (process.exitCode != 0) {
      print(process.stderr);
      throw ApplyingTagsException();
    }
  }
}
