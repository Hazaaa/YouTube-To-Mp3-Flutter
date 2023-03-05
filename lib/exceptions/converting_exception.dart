class ConvertingException implements Exception {
  @override
  String toString() =>
      'There was an error while trying to convert video to mp3!\n\nPossible problems:\n- Same mp3 file already exists in save folder.\n- Problem with ffmpeg. Reinstalling it maybe will solve the problem.\n- Some internal app problem. Reopen app and try again.\n\nIf nothing helps please try opening issue on GitHub repository and provide some information.';
}
