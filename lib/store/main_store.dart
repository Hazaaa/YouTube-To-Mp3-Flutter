import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_to_mp3_v2/services/download_and_convert_service_wrapper.dart';

// Include generated file by MobX
part 'main_store.g.dart';

// This is the class used by rest of your codebase
class MainStore = _MainStore with _$MainStore;

// The store class
abstract class _MainStore with Store {
  _MainStore(this._downloadAndConvertServicesWrapper);

  final DownloadAndConvertServicesWrapper _downloadAndConvertServicesWrapper;

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
    if (enteredVideoUrl.isEmpty) {
      error = '';
      videoUrl = '';
      return;
    }

    if (!_downloadAndConvertServicesWrapper.downloadService
        .checkVideoUrl(enteredVideoUrl)) {
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
    if (!_downloadAndConvertServicesWrapper.downloadService
        .checkVideoUrl(videoUrl)) {
      error = 'Provided Video URL is not valid! Please check it and try again!';
    } else {
      videoMetadata = await _downloadAndConvertServicesWrapper.downloadService
          .getVideoMetadata(videoUrl);
    }
    videoMetadataDownloadingInProgress = false;
  }

  @action
  Future<String> convert() async {
    convertingInProgress = true;
    final documentsDirectory = await getApplicationDocumentsDirectory();

    currentConvertingStep = 'Checking ffmpeg...';

    try {
      await Process.run('ffmpeg', ['-version'], runInShell: true);
    } on ProcessException catch (_) {
      return 'Missing ffmpeg...';
    }

    currentConvertingStep = 'Checking save path...';
    if (savePath.isEmpty) {
      savePath = documentsDirectory.path;
    }

    final fileBaseSavePath = '$savePath\\${videoMetadata?.title}';
    final mp4SavePath = '$fileBaseSavePath.mp4';
    final mp3SvePath = '$fileBaseSavePath.mp3';

    currentConvertingStep = 'Downloading video...';
    final pathToMp4 = await _downloadAndConvertServicesWrapper.downloadService
        .downloadVideo(videoId, mp4SavePath);

    currentConvertingStep = 'Converting video...';
    await _downloadAndConvertServicesWrapper.convertService
        .convertMp4ToMp3(pathToMp4, mp3SvePath);

    currentConvertingStep = 'Converting successfull!';
    convertingInProgress = false;

    return '';
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
