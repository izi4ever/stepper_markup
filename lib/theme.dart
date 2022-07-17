import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xfff4f4f4),
      foregroundColor: Colors.blueGrey[900],
      elevation: 0,
      shape: const Border(bottom: BorderSide(width: 1, color: Color(0xffdddddd))),
    ),
    scaffoldBackgroundColor: const Color(0xfff1f5f9),
    textTheme: GoogleFonts.vollkornTextTheme(
      Theme.of(context).textTheme,
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.only(top: 14),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey[900],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
      ),
    ),
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:     Radius.circular(20),
          topRight:    Radius.circular(20),
          bottomLeft:  Radius.circular(31),
          bottomRight: Radius.circular(31),
        ),
      ),
    ),
  );
}