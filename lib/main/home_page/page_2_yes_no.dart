import 'package:flutter/material.dart';

class YesNo extends StatefulWidget {
  const YesNo({Key? key}) : super(key: key);

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ...[true, false].map((e) =>                                             // <<<<<<<<
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, e);
            }, 
            child: Text( e ? 'YES' : 'NO' ),
          ),
        ),
      ],
    );
  }
}