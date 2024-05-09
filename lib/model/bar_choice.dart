import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarChoice {
  String label;
  IconData iconData;
  Widget page;

  BarChoice({required this.label, required this.iconData, required this.page});

  Icon get icon => Icon(iconData);

  BottomNavigationBarItem get item =>
      BottomNavigationBarItem(icon: icon, label: label);

  Text get titleforAppBar => Text(
        label,
        style: GoogleFonts.signika(fontSize: 30),
      );
}
