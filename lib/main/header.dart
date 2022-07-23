import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatefulWidget {
  Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Logotip', style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 24,
      )),
      trailing: Icon(
        FontAwesomeIcons.bell,
        size: 22,
        color: Colors.blueGrey[900],
      ),
    );
  }
}