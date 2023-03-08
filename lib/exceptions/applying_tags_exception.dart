class ApplyingTagsException implements Exception {
  ApplyingTagsException();

  @override
  String toString() =>
      'There was an error while trying to apply tags to your Mp3 file.\n\nThere could be a lot of possible errors so it is maybe better to apply them manually.';
}
