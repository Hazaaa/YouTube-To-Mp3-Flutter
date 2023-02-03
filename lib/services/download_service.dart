import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DownloadService {
  /// Check if youtube or youtube video url is valid.
  bool checkVideoUrl(String videoUrl) {
    return Uri.parse(videoUrl).host.isNotEmpty;
  }

  /// Gets video metadata.
  Future<Video> getVideoMetadata(String videoUrl) async {
    final yt = YoutubeExplode();

    var videoMetadata = await yt.videos.get(videoUrl);

    yt.close();

    return videoMetadata;
  }
}
