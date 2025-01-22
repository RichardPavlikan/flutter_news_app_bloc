import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    fontFamily: GoogleFonts.raleway().fontFamily,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Color(0xff933535),
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
