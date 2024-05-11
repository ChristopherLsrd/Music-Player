import 'dart:math';

import 'package:flutter/material.dart';
import 'package:musicplayer/model/enums/media_type.dart';
import 'package:musicplayer/model/raw_model/song.dart';
import 'package:musicplayer/views/player_view.dart';
import 'package:audioplayers/audioplayers.dart';

class MyPlayerController extends StatefulWidget {
  final Song songToPlay;
  final List<Song> playList;

  MyPlayerController({required this.songToPlay, required this.playList});

  @override
  MyPlayerControllerState createState() => MyPlayerControllerState();
}

class MyPlayerControllerState extends State<MyPlayerController> {
  late Song song;
  late AudioPlayer audioPlayer;
  AudioCache? audioCache;
  late Duration maxDuration;
  late Duration position;
  bool playShuffle = false;
  bool repeat = false;
  IconData iconData = Icons.play_arrow;

  @override
  void initState() {
    song = widget.songToPlay;
    maxDuration = const Duration(seconds: 0);
    position = const Duration(seconds: 0);
    setupPlayer();
  }

  @override
  void dispose() {
    clearPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlayerView(
        song: song,
        onRepeatPressed: onRepeatPressed,
        onShufflePressed: onShufflePressed,
        onPlayPausePressed: onPlayPausePressed,
        onRewindPressed: onRewindPressed,
        onForwardPressed: onForwardPressed,
        maxDuration: maxDuration,
        position: position,
        onPositionChanged: onPositionChanged,
        shuffle: playShuffle,
        repeat: repeat,
        iconData: iconData,
      );

  onRepeatPressed() {
    setState(() {
      repeat = (!repeat);
    });
  }

  onShufflePressed() {
    setState(() {
      playShuffle = (!playShuffle);
    });
  }

  onPlayPausePressed() async {
    final state = audioPlayer.state;
    switch (state) {
      case PlayerState.completed:
        onForwardPressed();
        break;
      case PlayerState.stopped:
        setupPlayer();
        break;
      case PlayerState.playing:
        await audioPlayer.pause();
        break;
      case PlayerState.disposed:
      case PlayerState.paused:
        await audioPlayer.resume();
        break;
      default:
    }
  }

  onRewindPressed() {}
  onForwardPressed() {}

  onPositionChanged(double newPosition) {
    final newDuration= Duration(seconds: newPosition.toInt());
      audioPlayer.seek(newDuration);
  }

  Future<String> pathForInApp() async {
    String string = "";
    audioCache = AudioCache();
    if (audioCache != null) {
      final uri = await audioCache!.load(song.path);
      string = uri.toString();
    }
    return string;
  }

  onStateChange(PlayerState state) {
    setState(() {
      switch (state) {
        case PlayerState.completed:
          break;
        case PlayerState.stopped:
          iconData=Icons.play_arrow;
          break;
        case PlayerState.playing:
          iconData = Icons.pause;
          break;
        case PlayerState.disposed:
        case PlayerState.paused:
          iconData = Icons.play_arrow;
          break;
        default:
      }
    });
  }

  onDurationChange(Duration duration){
    setState(() {
      maxDuration=duration;
    });
  }

  onPositionChange(Duration duration){
    setState(() {
      position=duration;
    });
  }

  setupPlayer() async {
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen(onStateChange);
    audioPlayer.onDurationChanged.listen(onDurationChange);
    audioPlayer.onPositionChanged.listen(onPositionChange);
    final url = (song.mediaType == MediaType.internet)
        ? song.path
        : await pathForInApp();
    await audioPlayer.play(UrlSource(url));
  }

  clearPlayer() {
    audioPlayer.stop();
    audioPlayer.dispose();
    if (audioCache != null) {
      audioCache?.clearAll();
    }
    audioCache = null;
  }
}
