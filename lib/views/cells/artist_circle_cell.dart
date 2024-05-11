import 'package:flutter/material.dart';
import 'package:musicplayer/controller/playlist_controller.dart';
import 'package:musicplayer/model/enums/playlist.dart';
import 'package:musicplayer/model/services/music_handler.dart';

import '../../model/raw_model/Artist.dart';

class ArtistCircleCell extends StatelessWidget {
  final Artist artist;
  final double height;
  const ArtistCircleCell({Key? key, required this.artist, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MusicHandler musicHandler = MusicHandler();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaylistController(
              title: artist.name,
              playlist: musicHandler.allMusicFromArtist(artist),
              type: Playlist.artist);
        }));
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ClipOval(
            child: Image.network(
          artist.urlImage,
          width: height,
          height: height,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
