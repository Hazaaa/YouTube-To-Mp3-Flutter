import 'dart:io';

import 'package:youtube_to_mp3_v2/exceptions/converting_exception.dart';

class ConvertService {
  Future<void> convertMp4ToMp3(String pathToMp4, String mp3SavePath) async {
    final ffmpegArguments = [
      '-i',
      pathToMp4,
      '-vn',
      '-ac',
      '2',
      '-b:a',
      '192k',
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
}
