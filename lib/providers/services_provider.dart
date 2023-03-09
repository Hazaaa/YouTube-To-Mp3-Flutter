import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youtube_to_mp3_v2/services/convert_service.dart';
import 'package:youtube_to_mp3_v2/services/download_and_convert_service_wrapper.dart';
import 'package:youtube_to_mp3_v2/services/download_service.dart';

class ServicesProvider {
  /// Provides required services using Provider package.
  static List<SingleChildWidget> provideRequiredServices() {
    return [
      Provider<DownloadAndConvertServicesWrapper>(
        create: (_) => DownloadAndConvertServicesWrapper(
          convertService: ConvertService(),
          downloadService: DownloadService(),
        ),
      )
    ];
  }
}
