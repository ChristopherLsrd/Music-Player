import 'package:flutter/material.dart';
import 'package:musicplayer/views/list_containers/album_container.dart';
import 'package:musicplayer/views/list_containers/artist_container.dart';
import 'package:musicplayer/views/list_containers/genre_container.dart';

class MusicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Divider(),
        //Artists Container
        ArtistContainer(),
        Divider(),
        //Albums Container
        AlbumContainer(),
        //Genres Container
        GenreContainer(),
        ],
    ));
  }
}
