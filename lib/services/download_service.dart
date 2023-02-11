import 'dart:io';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DownloadService {
  /// Check if youtube or youtube video url is valid.
  bool checkVideoUrl(String videoUrl) {
    if (videoUrl.isEmpty) {
      return false;
    }

    const String youtubeRegex =
        r"^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be|music\.youtube\.com)\/watch\?v=[A-Za-z0-9_-]+.*$";
    final RegExp pattern = RegExp(youtubeRegex);
    final bool match = pattern.hasMatch(videoUrl);

    return match;
  }

  /// Gets video metadata.
  Future<Video> getVideoMetadata(String videoUrl) async {
    final yt = YoutubeExplode();

    var videoMetadata = await yt.videos.get(videoUrl);

    yt.close();

    return videoMetadata;
  }

  /// Converting video to mp3.
  Future<void> convert(String videoId, String savePath) async {
    final yt = YoutubeExplode();

    var manifest = await yt.videos.streamsClient.getManifest(videoId);

    var streamInfo = manifest.audioOnly.withHighestBitrate();

    var stream = yt.videos.streamsClient.get(streamInfo);

    // Open a file for writing.
    var file = File(savePath);
    var fileStream = file.openWrite();

    // Pipe all the content of the stream into the file.
    await stream.pipe(fileStream);

    // Close the file.
    await fileStream.flush();
    await fileStream.close();
    yt.close();
  }
}
