import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stepper_markup/theme/theme_const.dart';
import 'package:stepper_markup/theme/tpl_card_default.dart';
import 'package:stepper_markup/theme/tpl_page_body_padding.dart';

// import '../../theme_const.dart';
import '../header.dart';
import 'stepper/card_with_stepper.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.upToDateTime,
  }) : super(key: key);

  DateTime? upToDateTime;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return PageBodyPadding(
      children: [
        Header(),
        CardWithStepper(),
        SizedBox(
          height: 300,
          child: CardDefault(
            title: 'Upcoming', 
            child: Text(
              () {
                if (widget.upToDateTime == null) {
                  return 'You have no upcoming events';
                } else {
                  DateTime? dt = widget.upToDateTime;
                  return DateFormat().add_yMMMMd().add_jm().format(dt!);
                }
              }()
            ),
          ),
        ),
      ],
    );
  }
}
