import 'package:flutter/material.dart';
import 'package:musicplayer/model/bar_choice.dart';
import 'package:musicplayer/views/music_view.dart';

//Home page

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex=0;
  List<BarChoice> items= [
    BarChoice(label: "Music", iconData: Icons.music_note, page: MusicView()),
    BarChoice(label: "Favorites", iconData: Icons.whatshot, page: Container()),
    BarChoice(label: "Search", iconData: Icons.search, page: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  Icon(Icons.radio),
                  Icon(Icons.doorbell),
                  Icon(Icons.settings)
                ],
              ),
              items[currentIndex].titleforAppBar
            ],
          ),
        )),
      ),
      body: items[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items.map((i) => i.item).toList(),
        onTap: barTapped,
      ),
    );
  }

  barTapped(int index){
    setState(() {
      currentIndex=index;
    });
  }
}
