import 'package:flutter/material.dart';

class CardWithoutHeader extends StatefulWidget {
  CardWithoutHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  State<CardWithoutHeader> createState() => _CardWithoutHeaderState();
}

class _CardWithoutHeaderState extends State<CardWithoutHeader> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 2),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
              child: widget.child,
            ),
          )
        ],
      ),
    );
  }
}