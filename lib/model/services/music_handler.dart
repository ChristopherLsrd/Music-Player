import 'package:musicplayer/model/services/music_datas.dart';

import '../enums/Genre.dart';
import '../raw_model/Artist.dart';
import '../raw_model/Album.dart';

class MusicHandler{
  final datas = MusicDatas();

  List<Artist> allArtists(){
    List<Artist> artists=[];
    final all= datas.allDatas();

    for(var song in all){
      if(!artists.contains(song.artist)){
        artists.add(song.artist);
      }
    }

    return artists;
  }

  List<Album> allAlbums(){
    List<Album> albums=[];
    final all= datas.allDatas();

    for(var song in all){
      final singer = song.artist.name;
      final albumTitle = song.album;
      Album newAlbum = albums.firstWhere((album) => (album.artist.name == singer && album.title==albumTitle),
      orElse: ()=> Album(artist: song.artist,title: song.album,trackList:[song]));
      if(!newAlbum.trackList.contains(song)){
        newAlbum.trackList.add(song);
      }
      if(!albums.contains(newAlbum)){
        albums.add(newAlbum);
      }
    }

    return albums;
  }

  List<Genre> allGenres(){
    List<Genre> genres=[];
    final all= datas.allDatas();

    for(var song in all){
      if(!genres.contains(song.genre)){
        genres.add(song.genre);
      }
    }

    return genres;
  }
}