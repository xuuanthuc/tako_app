import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  // primaryColor: Colors.purple,
  // accentColor: Colors.purpleAccent,
  // splashColor: Colors.purpleAccent,
  // highlightColor: Colors.purple,
  fontFamily: GoogleFonts.sarabun.toString(),
  scaffoldBackgroundColor: HexColor("#E5E5E5"),
  textTheme: TextTheme(
    headline6: GoogleFonts.sarabun(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final TextStyle cardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

final TextStyle detailTextStyle = GoogleFonts.sarabun(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Colors.black
);
