import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        FontAwesomeIcons.solidCalendarCheck,
        size: 100,
        color: Colors.grey[400],
      ),
    );
  }
}