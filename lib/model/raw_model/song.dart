import 'package:musicplayer/model/raw_model/Artist.dart';
import 'package:musicplayer/model/enums/Genre.dart';
import 'package:musicplayer/model/enums/media_type.dart';

class Song {
  int id;
  String title;
  String album;
  String path;
  String thumb;
  Artist artist;
  Genre genre;
  MediaType mediaType;

  Song(
      {required this.id,
      required this.title,
      required this.album,
      required this.path,
      required this.thumb,
      required this.artist,
      required this.genre,
      required this.mediaType});
}
