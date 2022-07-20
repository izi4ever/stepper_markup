import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_calendar.dart';

class ShowAlertDialog extends StatefulWidget {
  const ShowAlertDialog({Key? key}) : super(key: key);

  @override
  State<ShowAlertDialog> createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(top: 7, left: 10, right: 10, ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.83,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(FontAwesomeIcons.circleXmark,
                  color: Colors.grey[400],
                  size: 30,
                ),
              ),
            ),
            CustomCalendar(
              onDateTimeTap: (DateTime time) {
                setState(() {
                  selectedDate = time;                  
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: () {
                if (selectedDate != null) {
                  return Colors.blueGrey[900];
                } else {
                  return Colors.blueGrey[100];
                }
              }(),
            ),
            onPressed: () {
              if (selectedDate != null) {
                Navigator.pop(context, selectedDate);
              }
            },
            child: const Text('Choose'),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
    );
  }
}