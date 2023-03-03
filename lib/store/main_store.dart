import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_to_mp3_v2/services/download_service.dart';

// Include generated file by MobX
part 'main_store.g.dart';

// This is the class used by rest of your codebase
class MainStore = _MainStore with _$MainStore;

// The store class
abstract class _MainStore with Store {
  _MainStore(this._downloadService);

  final DownloadService _downloadService;

  @observable
  String videoUrl = '';

  @observable
  String videoId = '';

  @observable
  Video? videoMetadata;

  @observable
  bool videoMetadataDownloadingInProgress = false;

  @observable
  bool convertingInProgress = false;

  @observable
  String error = '';

  @observable
  String savePath = '';

  @observable
  bool saveVideoAlso = false;

  @observable
  String currentConvertingStep = '';

  @action
  setVideoUrl(String enteredVideoUrl) {
    if (!_downloadService.checkVideoUrl(enteredVideoUrl)) {
      error = 'Provided Video URL is not valid! Please check it and try again!';
    } else {
      videoUrl = enteredVideoUrl;
      videoId = convertUrlToId(enteredVideoUrl)!;
      error = '';
    }
  }

  @action
  getVideoMetadata() async {
    videoMetadataDownloadingInProgress = true;
    if (!_downloadService.checkVideoUrl(videoUrl)) {
      error = 'Provided Video URL is not valid! Please check it and try again!';
    } else {
      videoMetadata = await _downloadService.getVideoMetadata(videoUrl);
    }
    videoMetadataDownloadingInProgress = false;
  }

  @action
  Future<void> convert() async {
    convertingInProgress = true;

    currentConvertingStep = 'Checking save path...';
    if (savePath.isEmpty) {
      final documentsDirectory = await getApplicationDocumentsDirectory();

      savePath = documentsDirectory.path;
    }

    currentConvertingStep = 'Downloading video...';
    await _downloadService.downloadVideo(videoId, savePath);
  }

  @action
  void clearInput() {
    videoUrl = '';
    videoId = '';
    videoMetadata = null;
    videoMetadataDownloadingInProgress = false;
    convertingInProgress = false;
    error = '';
    savePath = '';
    saveVideoAlso = false;
    currentConvertingStep = '';
  }

  String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();
    const youtubeUrlPattern =
        r"^(https?\:\/\/)?(www\.)?(youtube\.com|youtu\.?be|music\.youtube\.com)\/watch\?v=([A-Za-z0-9_-]+).*$";

    RegExp exp = RegExp(youtubeUrlPattern);
    RegExpMatch? match = exp.firstMatch(url);

    return match != null ? match.group(4)! : null;
  }
}
