import 'dart:io';

class Mp3Tag {
  String? title;

  String? author;

  String? album;

  String? albumArtist;

  String? year;

  String? genre;

  File? albumCoverImage;

  Mp3Tag(
      {this.title,
      this.author,
      this.album,
      this.albumArtist,
      this.year,
      this.genre,
      this.albumCoverImage});

  Mp3Tag setAlbumCover(File albumCoverImage) {
    final tempNewTag = Mp3Tag.createNewCopy(this);
    tempNewTag.albumCoverImage = albumCoverImage;

    return tempNewTag;
  }

  static Mp3Tag createNewCopy(Mp3Tag? original) {
    if (original == null) {
      return Mp3Tag();
    }

    return Mp3Tag(
        title: original.title,
        author: original.author,
        album: original.album,
        albumArtist: original.albumArtist,
        year: original.year,
        genre: original.genre,
        albumCoverImage: original.albumCoverImage);
  }
}
