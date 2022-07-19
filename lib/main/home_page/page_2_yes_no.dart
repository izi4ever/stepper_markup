import 'package:flutter/material.dart';

class YesNo extends StatefulWidget {
  YesNo({Key? key}) : super(key: key);

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          child: Text('YES'),
          onPressed: () {
            Navigator.pop(context, true);
          }, 
        ),
        ElevatedButton(
          child: Text('NO'),
          onPressed: () {
            Navigator.pop(context, false);
          }, 
        ),
      ],
    );
  }
}