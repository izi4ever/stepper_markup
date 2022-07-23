import 'package:flutter/material.dart';

class CardDefault extends StatefulWidget {
  CardDefault({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  String title;
  Widget child;

  @override
  State<CardDefault> createState() => _CardDefaultState();
}

class _CardDefaultState extends State<CardDefault> {
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Column(
              children: [
                ListTile( 
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                  title: Text(
                    widget.title, 
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Divider(height: 1, thickness: 0.04, color:  Color(0xff000000)),
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