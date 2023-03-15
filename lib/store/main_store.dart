import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_to_mp3_v2/exceptions/applying_tags_exception.dart';
import 'package:youtube_to_mp3_v2/exceptions/converting_exception.dart';
import 'package:youtube_to_mp3_v2/exceptions/missing_ffmpeg_exception.dart';
import 'package:youtube_to_mp3_v2/models/mp3_tag.dart';
import 'package:youtube_to_mp3_v2/models/result.dart';
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
  double convertProggressPrecentage = 0.0;

  @observable
  String convertCurrentStep = '';

  @observable
  Mp3Tag? tag;

  @action
  setVideoUrl(String enteredVideoUrl) {
    if (enteredVideoUrl.isEmpty) {
      error = '';
      videoUrl = '';
      return;
    }

    if (!_downloadAndConvertServicesWrapper.downloadService
        .checkVideoUrl(enteredVideoUrl)) {
      _updateConvertingErrorText(
          'Provided Video URL is not valid! Please check it and try again!');
    } else {
      videoUrl = enteredVideoUrl;
      videoId = convertUrlToId(enteredVideoUrl)!;
      _updateConvertingErrorText('');
    }
  }

  @action
  getVideoMetadata() async {
    videoMetadataDownloadingInProgress = true;
    if (!_downloadAndConvertServicesWrapper.downloadService
        .checkVideoUrl(videoUrl)) {
      _updateConvertingErrorText(
          'Provided Video URL is not valid! Please check it and try again!');
    } else {
      videoMetadata = await _downloadAndConvertServicesWrapper.downloadService
          .getVideoMetadata(videoUrl);
      tag = Mp3Tag(title: videoMetadata!.title, author: videoMetadata!.author);
    }
    videoMetadataDownloadingInProgress = false;
  }

  @action
  Future<Result> convert() async {
    convertingInProgress = true;
    final documentsDirectory = await getApplicationDocumentsDirectory();

    _updateConvertingCurrentProcessText('Checking ffmpeg...');

    Result isFfmpegInstalledResult = await _isFfmpegInstalled();
    if (!isFfmpegInstalledResult.succesfull) {
      return isFfmpegInstalledResult;
    }

    _updateConvertingProcessPrecentage(0.05);

    _updateConvertingCurrentProcessText('Checking save path...');
    if (savePath.isEmpty) {
      savePath = documentsDirectory.path;
    }

    _updateConvertingProcessPrecentage(0.1);

    final fileBaseSavePath = '$savePath\\${videoMetadata?.title}';
    final mp4SavePath = '$fileBaseSavePath.mp4';
    final mp3SavePath = '$fileBaseSavePath.mp3';

    try {
      _updateConvertingCurrentProcessText('Downloading video...');
      final pathToMp4 = await _downloadAndConvertServicesWrapper.downloadService
          .downloadVideo(videoId, mp4SavePath);

      _updateConvertingProcessPrecentage(0.5);

      _updateConvertingCurrentProcessText('Converting video...');
      await _downloadAndConvertServicesWrapper.convertService
          .convertMp4ToMp3(pathToMp4, mp3SavePath);

      _updateConvertingProcessPrecentage(0.8);

      _updateConvertingCurrentProcessText('Applying tags...');
      await _downloadAndConvertServicesWrapper.convertService
          .applyTagsToMp3(mp3SavePath, tag);
    } on ConvertingException catch (ex) {
      return Result(succesfull: false, exception: ex);
    } on ApplyingTagsException catch (ex) {
      return Result(succesfull: false, exception: ex);
    }

    _updateConvertingProcessPrecentage(1);

    _updateConvertingCurrentProcessText('Converting successfull!');
    convertingInProgress = false;

    return Result(succesfull: true);
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
    convertCurrentStep = '';
    convertProggressPrecentage = 0.0;
    tag = null;
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

  /// Runs 'ffmpeg -version' function to check if ffmpeg is installed on device.
  ///
  /// [Returns] - 'Result' object containing true if ffmpeg is installed, otherwise false and adequate exception.
  Future<Result> _isFfmpegInstalled() async {
    late bool isFfmpegInstalled;

    try {
      await Process.run('ffmpeg', ['-version'], runInShell: true);
      isFfmpegInstalled = true;
    } on ProcessException catch (_) {
      isFfmpegInstalled = false;
    }

    return Result(
      succesfull: isFfmpegInstalled,
      exception: !isFfmpegInstalled ? MissingFfmpegException() : null,
    );
  }

  void _updateConvertingCurrentProcessText(String currentStep) {
    convertCurrentStep = currentStep;
  }

  void _updateConvertingProcessPrecentage(double precentage) {
    convertProggressPrecentage = precentage;
  }

  void _updateConvertingErrorText(String errorText) {
    error = errorText;
  }
}
