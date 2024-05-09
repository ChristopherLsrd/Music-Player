import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/model/enums/Genre.dart';

class GenreCell extends StatelessWidget{
  final Genre genre;

  const GenreCell({required this.genre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1)
          ),
          child: Center(child: Text(genre.name,style: GoogleFonts.signika(fontSize: 20, color: Colors.blueGrey),)),
      ),
    );
  }

  onTap(){

  }
}