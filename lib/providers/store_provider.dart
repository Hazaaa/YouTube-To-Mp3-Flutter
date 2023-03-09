import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:youtube_to_mp3_v2/services/download_and_convert_service_wrapper.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';

class StoreProvider {
  /// Provides MobX store with required services using Provider package.
  static SingleChildWidget provideStore() {
    return ProxyProvider<DownloadAndConvertServicesWrapper, MainStore>(
      update: (_, downloadAndConvertServicesWrapper, __) =>
          MainStore(downloadAndConvertServicesWrapper),
    );
  }
}
