import 'package:mobx/mobx.dart';
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
  Video? videoMetadata;

  @observable
  bool actionInProgress = false;

  @observable
  String error = '';

  @action
  getVideoMetadata() async {
    actionInProgress = true;
    if (!_downloadService.checkVideoUrl(videoUrl)) {
      error = 'Provided Video URL is not valid! Please check it and try again!';
    } else {
      videoMetadata = await _downloadService.getVideoMetadata(videoUrl);
    }
    actionInProgress = false;
  }

  @action
  void convert() {
    actionInProgress = true;
  }

  @action
  void clearInput() {
    videoUrl = '';
    videoMetadata = null;
    actionInProgress = false;
    error = '';
  }
}
