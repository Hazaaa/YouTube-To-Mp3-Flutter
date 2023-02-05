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
}
