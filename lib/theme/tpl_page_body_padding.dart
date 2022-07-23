import 'package:flutter/material.dart';

class PageBodyPadding extends StatefulWidget {
  PageBodyPadding({
    Key? key,
    required this.children,
  }) : super(key: key);

  List<Widget> children;

  @override
  State<PageBodyPadding> createState() => _PageBodyPaddingState();
}

class _PageBodyPaddingState extends State<PageBodyPadding> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: widget.children,
    );
  }
}