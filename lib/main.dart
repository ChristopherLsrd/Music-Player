import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/controller/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.signika(color: Colors.black,fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black)
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}


