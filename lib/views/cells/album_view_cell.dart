import 'package:flutter/material.dart';
import 'package:musicplayer/controller/playlist_controller.dart';
import 'package:musicplayer/model/enums/playlist.dart';

import '../../model/raw_model/Album.dart';

class AlbumViewCell extends StatelessWidget {
  final Album album;
  final double height;
  const AlbumViewCell({Key? key, required this.album, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PlaylistController(
                title: album.title,
                playlist: album.trackList,
                type: Playlist.album);
          }));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            album.trackList[0].thumb,
            fit: BoxFit.fill,
          ),
        ));
  }
}
