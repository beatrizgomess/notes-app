import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFe2e2ff);
  static Color mainColor = Color.fromARGB(255, 255, 255, 255);
  static Color accentColor = Color(0xFF0065FF);

  //Setting the Cards different Color
  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blueGrey.shade100,
    Colors.purple.shade100
  ];

  static Color background = Colors.yellow.shade100;
  static Color iconsColor = Colors.blue;
  //Setting the text Style

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 12.0, fontWeight: FontWeight.w400);

  static TextStyle dateTime =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);
  static TextStyle contentReaderView =
      GoogleFonts.nunito(fontSize: 18.0, fontWeight: FontWeight.w400);
  static TextStyle titleReaderView =
      GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.bold);
}
