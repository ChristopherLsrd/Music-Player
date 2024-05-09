import 'package:flutter/material.dart';

import '../../model/raw_model/Album.dart';

class AlbumViewCell extends StatelessWidget{
  final Album album;
  final double height;
  const AlbumViewCell({Key ? key,required this.album,required this.height}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(borderRadius: BorderRadius.circular(8),
      child: Image.network(album.trackList[0].thumb,fit: BoxFit.fill,),
      )
    );
  }

  onTap(){
  }
}