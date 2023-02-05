import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DownloadService {
  /// Check if youtube or youtube video url is valid.
  bool checkVideoUrl(String videoUrl) {
    if (videoUrl.isEmpty) {
      return false;
    }

    final RegExp pattern = RegExp(
        r'^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$');
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
