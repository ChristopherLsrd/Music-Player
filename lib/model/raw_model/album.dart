import 'package:musicplayer/model/raw_model/Artist.dart';
import 'package:musicplayer/model/raw_model/Song.dart';

class Album{
  String title;
  Artist artist;
  List<Song> trackList;

  Album({required this.title,required this.artist,required this.trackList});
}