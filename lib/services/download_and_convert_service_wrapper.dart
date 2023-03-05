import 'package:youtube_to_mp3_v2/services/convert_service.dart';
import 'package:youtube_to_mp3_v2/services/download_service.dart';

class DownloadAndConvertServicesWrapper {
  final DownloadService downloadService;
  final ConvertService convertService;

  DownloadAndConvertServicesWrapper(
      {required this.downloadService, required this.convertService});
}
