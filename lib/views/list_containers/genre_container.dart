import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/views/cells/genre_cell.dart';

import '../../model/enums/Genre.dart';
import '../../model/services/music_handler.dart';

class GenreContainer extends StatelessWidget{
   final List<Genre> genres=MusicHandler().allGenres(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Genres :",style: GoogleFonts.signika(fontSize: 20),),
          Container(
            height: 75,
            child: ListView.builder(
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context,index)=> GenreCell(genre: genres[index]))
            ),
          )
        ],
      ),
    );
  }
}