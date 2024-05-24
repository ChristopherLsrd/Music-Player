import 'package:flutter/material.dart';
import 'package:musicplayer/controller/player_controller.dart';
import 'package:musicplayer/model/raw_model/song.dart';


class ClassicTile extends StatelessWidget {
  final List<Song> playlist;
  final int index;

  ClassicTile({required this.playlist, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(playlist[index].thumb),
      title: Text(playlist[index].title),
      trailing: Icon(Icons.play_arrow),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyPlayerController(
            songToPlay: playlist[index],
            playList: playlist,
          );
        }));
      },
    );
  }
}
