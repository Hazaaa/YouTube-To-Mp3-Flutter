import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_to_mp3_v2/extensions/datetime_extension.dart';
import 'package:youtube_to_mp3_v2/extensions/duration_extension.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/theme/theme_constants.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({Key? key}) : super(key: key);

  static const double detailsHorizontalSpacing = 15;

  List<Widget> getDetailWidgetWithSpacing(String detailName, String? text) {
    return [
      const SizedBox(height: detailsHorizontalSpacing),
      Row(
        children: [
          Text(
            "$detailName: ",
            style: ThemeConstants.textDetailNameStyle,
          ),
          SizedBox(
            width: 250,
            child: Text(
              text ?? "/",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    ];
  }

  List<Widget> getDetailsWidgets(MainStore store) {
    List<Widget> detailsToDesplayWidgets = List.empty(growable: true);

    if (store.videoMetadata == null) {
      return detailsToDesplayWidgets;
    }

    if (store.videoMetadata!.title.isNotEmpty) {
      detailsToDesplayWidgets.addAll(
        getDetailWidgetWithSpacing("Title", store.videoMetadata!.title),
      );
    }

    if (store.videoMetadata!.author.isNotEmpty) {
      detailsToDesplayWidgets.addAll(
        getDetailWidgetWithSpacing("Author", store.videoMetadata!.author),
      );
    }

    if (store.videoMetadata!.duration != null) {
      detailsToDesplayWidgets.addAll(getDetailWidgetWithSpacing(
          "Duration", store.videoMetadata!.duration.formatHHMMSS()));
    }

    if (store.videoMetadata!.publishDate != null) {
      detailsToDesplayWidgets.addAll(getDetailWidgetWithSpacing(
          "Publish date", store.videoMetadata!.publishDate!.formatDDMMYYYY()));
    }

    if (store.videoMetadata!.uploadDate != null) {
      detailsToDesplayWidgets.addAll(getDetailWidgetWithSpacing(
          "Upload date", store.videoMetadata!.uploadDate!.formatDDMMYYYY()));
    }

    return detailsToDesplayWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: 0.56,
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                  YoutubeThumbnail(youtubeId: store.videoId).hd(),
                ),
              ),
            ),
          ),
          ...getDetailsWidgets(store)
        ],
      ),
    );
  }
}
