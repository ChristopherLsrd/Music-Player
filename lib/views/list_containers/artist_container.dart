import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/model/raw_model/Artist.dart';
import 'package:musicplayer/model/services/music_handler.dart';
import 'package:musicplayer/views/cells/artist_circle_cell.dart';

class ArtistContainer extends StatelessWidget{

 final List<Artist> artists=MusicHandler().allArtists(); 
@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Artists :",style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 90,
            child: ListView.builder(
              itemCount: artists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context,index)=> ArtistCircleCell(artist: artists[index], height: 75))
            ),
          )
        ],
      ),
    );
  }
}