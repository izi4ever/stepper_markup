import 'package:flutter/material.dart';

class FormLabel extends StatefulWidget {
  FormLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  String title;

  @override
  State<FormLabel> createState() => _FormLabelState();
}

class _FormLabelState extends State<FormLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        widget.title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 11,
        ),
      ),
    );
  }
}