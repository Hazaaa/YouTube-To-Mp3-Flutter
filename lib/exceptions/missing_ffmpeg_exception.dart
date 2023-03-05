class MissingFfmpegException implements Exception {
  MissingFfmpegException();

  @override
  String toString() =>
      'MissingFfmpegException: Ffmpeg is missing from the machine!';
}
