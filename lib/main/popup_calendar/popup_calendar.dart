import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '__custom_calendar.dart';

import 'marked_calendar.dart';


class CalendarPopup extends StatefulWidget {
  const CalendarPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarPopup> createState() => _CalendarPopupState();
}

class _CalendarPopupState extends State<CalendarPopup> {

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // scrollable: true,                                                       // <<< viewPort error
      insetPadding: EdgeInsets.zero,                                          // <<< Отступы от экрана!!!
      contentPadding: const EdgeInsets.only(top: 7, left: 10, right: 10, ),
      content: SizedBox(                                                      // <<<
        width: MediaQuery.of(context).size.width * 0.83,                      // <<< Ширина экрана * множитель
        // width: double.maxFinite * 0.85,                                       // Так умножение не работает
        child: ListView(                                                      // <<<
          shrinkWrap: true,                                                   // <<< Схлопывает по высоте содержимого
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
            // CustomCalendar(),                                                 // <<< Не выделяются дни с датами
            // TODO: pass function, which will be setting local selected date \ time
            MarkedCalendar(
              onDateTimeTap: (DateTime time) {
                print('onDateTimeTap triggered: $time');
                selectedDate = time;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: double.infinity,
          // TODO: change button style depending on selectedDate state.
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, selectedDate);
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