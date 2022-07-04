import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/bottom_nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Markup',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff4f4f4),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xfff1f5f9),
        textTheme: GoogleFonts.vollkornTextTheme(
          Theme.of(context).textTheme,
        ),
        cardTheme: CardTheme(
          margin: EdgeInsets.only(top: 14),
        ),
      ),
      home: const BottomNavBar(),
    );
  }
}
