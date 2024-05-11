import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/model/raw_model/song.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  final EdgeInsets padding = const EdgeInsets.all(8);
  final Container spacer =  Container(width: 16,);
  final Color bg = Color.fromRGBO(Random().nextInt(265),Random().nextInt(265),Random().nextInt(265),1);
  final Duration maxDuration;
  final Duration position;
  final bool shuffle;
  final bool repeat;
  final IconData iconData;
  final Function() onRepeatPressed;
  final Function() onShufflePressed;
  final Function() onPlayPausePressed;
  final Function() onRewindPressed;
  final Function() onForwardPressed;
  final Function(double newPosition) onPositionChanged;


  PlayerView({
    required this.song,
  required this.onRepeatPressed,
  required this.onShufflePressed,
  required this.onPlayPausePressed,
  required this.onRewindPressed,
  required this.onForwardPressed,
  required this.maxDuration,
  required this.position,
  required this.onPositionChanged,
  required this.shuffle,
  required this.repeat,
  required this.iconData 
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(song.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.network(song.thumb,
                  fit: BoxFit.fill, height: size.width / 2),
            ),
            
            Divider(thickness: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share),
                spacer,
                Icon(Icons.menu),
                spacer,
                Icon(Icons.whatshot)
              ],
            ),
            Text(song.artist.name,style: GoogleFonts.signika(color: Colors.red,fontSize: 35),),
            Text(song.title,style: GoogleFonts.signika(fontSize: 20,fontWeight: FontWeight.bold)),
            Card(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        IconButton(onPressed: onRepeatPressed, icon: Icon((repeat)?Icons.repeat_on_rounded: Icons.repeat_rounded)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: padding,child: IconButton(onPressed: onRewindPressed,icon: Icon(Icons.fast_rewind),),),
                            Padding(padding: padding,child: IconButton(onPressed: onPlayPausePressed,icon: Icon(iconData),),),
                            Padding(padding: padding,child: IconButton(onPressed: onForwardPressed,icon: Icon(Icons.fast_forward),),)
                          ],
                        ),
                        IconButton(onPressed: onShufflePressed, icon: Icon((shuffle)?Icons.shuffle_rounded : Icons.shuffle_on_rounded),)
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(readableDuration(Duration(seconds: 0)),style: GoogleFonts.signika(fontSize: 18,color: Colors.red)),
                            Text(readableDuration(position),style: GoogleFonts.signika(fontSize: 18,color: Colors.red),),
                            Text(readableDuration(maxDuration),style: GoogleFonts.signika(fontSize: 18,color: Colors.red),)
                          ],
                        ),
                        Slider(
                          min: 0,
                          max: maxDuration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          onChanged: onPositionChanged,
                          thumbColor: Colors.red,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.speaker),
                Icon(Icons.timer),
                Icon(Icons.whatshot_outlined)
              ],
            ),
          ],
        ),
      ),
    );
  }

  String readableDuration(Duration duration){
    int minute = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    String secondStr=(seconds<10)? "0$seconds": seconds.toString();
    return (minute.toString()+":"+secondStr);

  }
}
