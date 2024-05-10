import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/controller/player_controller.dart';
import 'package:musicplayer/model/enums/playlist.dart';
import 'package:musicplayer/model/raw_model/song.dart';

class PlaylistController extends StatelessWidget {
  final List<Song> playlist;
  final String title;
  final Playlist type;

  PlaylistController(
      {required this.title, required this.playlist, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: SafeArea(
          child: Column(
        children: [
          topView(MediaQuery.of(context).size),
          Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Image.network(playlist[index].thumb),
                      title: Text(playlist[index].title),
                      trailing: Icon(Icons.play_arrow),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyPlayerController();
                        }));
                      },
                    );
                  }),
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: playlist.length))
        ],
      )),
    );
  }

  Widget topView(Size size) {
    switch (type) {
      case Playlist.artist:
        return Container();
      case Playlist.album:
        return Container(
          child: Column(
            children: [
              Image.network(playlist.first.thumb, height: size.height / 4),
              Text(
                playlist.first.album,
                style: GoogleFonts.signika(fontSize: 25),
              ),
              Text(playlist.first.artist.name,
                  style: GoogleFonts.signika(fontSize: 16, color: Colors.red))
            ],
          ),
        );
      case Playlist.genre:
        return Container();
      default:
        return Container();
    }
  }
}
