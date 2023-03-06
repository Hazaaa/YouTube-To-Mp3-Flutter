import 'dart:io';

class Mp3Tag {
  String? title;

  String? author;

  String? album;

  String? genre;

  File? albumCoverImage;

  Mp3Tag(
      {this.title, this.author, this.album, this.genre, this.albumCoverImage});

  static Mp3Tag createNewCopy(Mp3Tag? original) {
    if (original == null) {
      return Mp3Tag();
    }

    return Mp3Tag(
        title: original.title,
        author: original.author,
        album: original.album,
        genre: original.genre,
        albumCoverImage: original.albumCoverImage);
  }
}
