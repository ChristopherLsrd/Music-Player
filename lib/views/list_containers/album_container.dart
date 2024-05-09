import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/raw_model/Album.dart';
import '../../model/services/music_handler.dart';
import '../cells/album_view_cell.dart';

class AlbumContainer extends StatelessWidget{
  final List<Album> artists=MusicHandler().allAlbums(); 

  @override
  Widget build(BuildContext context) {
   return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Albums :",style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 300,
            child: GridView.builder(
              itemCount: artists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context,index)=> AlbumViewCell(album: artists[index], height: 75))
            ),
          )
        ],
      ),
    );
  }
}