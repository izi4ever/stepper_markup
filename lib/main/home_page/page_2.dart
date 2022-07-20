import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'page_2_yes_no.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          final dialogResult = await showDialog<bool>(
            context: context, 
            builder: (context) {
              return const YesNo();
            }
          );
          print('Result from dialog: $dialogResult');
        },
        child: Icon(
          FontAwesomeIcons.solidCalendarCheck,
          size: 100,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}