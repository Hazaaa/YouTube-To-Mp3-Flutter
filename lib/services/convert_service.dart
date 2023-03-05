import 'dart:io';

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
        await Process.start('ffmpeg', ffmpegArguments, runInShell: true);

    process.exitCode.then(
      (value) async {
        if (exitCode == -1) {
          return;
        }

        // Removing temporary mp4 file.
        await File(pathToMp4).delete();
      },
    );
  }
}
