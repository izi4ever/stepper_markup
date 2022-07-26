import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/theme.dart';
import 'main/bottom_nav_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Markup',
      theme: customTheme(context),
      home: const BottomNavBar(),
    );
  }
}