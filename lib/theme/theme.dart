import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customTheme(BuildContext context) {
  return ThemeData(
    primaryColor: Colors.blueGrey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xfff4f4f4),
      foregroundColor: Colors.blueGrey[900],
      elevation: 0,
      shape: const Border(bottom: BorderSide(width: 1, color: Color(0xffdddddd))),
      toolbarHeight: 43,
      iconTheme: const IconThemeData(
        color: Color(0xff057afb),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
      // systemOverlayStyle: SystemUiOverlayStyle.systemStatusBarContrastEnforced,
      // systemOverlayStyle: SystemChrome
    ),
    scaffoldBackgroundColor: const Color(0xfff1f5f9),
    textTheme: GoogleFonts.vollkornTextTheme(
      Theme.of(context).textTheme,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.only(top: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.blueGrey[900],
        backgroundColor: const Color(0xfff9fafc),
        // side: BorderSide(color: Colors.grey[200]!, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      )
      // style: ButtonStyle(
      //   textStyle: ,
      // ),
      // style: TextStyle(color: Colors.blueGrey[900]!),
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