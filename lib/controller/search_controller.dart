import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/model/raw_model/song.dart';
import 'package:musicplayer/model/services/music_handler.dart';
import 'package:musicplayer/model/services/shared_handler.dart';
import 'package:musicplayer/views/cells/classic_tile.dart';

class MySearchController extends StatefulWidget {
  @override
  MySearchControllerState createState() => MySearchControllerState();
}

class MySearchControllerState extends State<MySearchController> {
  List<String> lastSearchedSongs = [];
  List<Song> searchResults = [];

  late TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 75,
          child: Row(children: [
            Expanded(
                child: TextField(
              controller: textEditingController,
              onChanged: search,
              onSubmitted: save,
              decoration: InputDecoration(
                hintText: "Search...",
              ),
            )),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: onPressed,
            )
          ]),
        ),
        Text(
          (textEditingController.text == "") ? "Recent searchs :" : "Results :",
          style: GoogleFonts.signika(fontSize: 20),
        ),
        Expanded(
            child: (textEditingController.text == "")
                ? emptyWidget()
                : onSearchWidget())
      ],
    ));
  }

  Widget emptyWidget() {
    return ListView.separated(
        itemBuilder: ((context, index) {
          final String value = lastSearchedSongs[index];
          return ListTile(
              title: Text(value),
              onTap: (() => onTap(value)),
              onLongPress: (() => remove(value)));
        }),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: lastSearchedSongs.length);
  }

  Widget onSearchWidget() {
    return ListView.separated(
        itemBuilder: ((context, index) => ClassicTile(
              playlist: searchResults,
              index: index,
            )),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: searchResults.length);
  }

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    getSharedPref();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  onTap(String value) {
    textEditingController.text = value;
    search(value);
  }

  closeKeyboard()=>FocusScope.of(context).requestFocus(FocusNode());

  onPressed() {
    closeKeyboard();
    if(textEditingController.text!=""){
      save(textEditingController.text);
    }
  }

  search(String string) {
    MusicHandler musicHandler = MusicHandler();
    final result = musicHandler.research(string);
    setState(() {
      searchResults = result;
    });
  }

  save(String value) {
    SharedHandler().addItemToList(value).then((value) => getSharedPref());
  }

  getSharedPref() {
    SharedHandler().getList().then((newList) => {
          setState(() {
            lastSearchedSongs = newList;
          })
        });
  }

  remove(String value) {
    SharedHandler()
        .removeItemToList(value)
        .then((success) => {getSharedPref()});
  }
}
