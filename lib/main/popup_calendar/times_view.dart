import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'free_time_list.dart';

class TimesView extends StatefulWidget {
  TimesView({
    Key? key,
    required this.selectedDayIndex,
    required this.onDateTimeTap,
    required this.highlightTime,
    required this.selectedDay,
  }) : super(key: key);

  int selectedDayIndex;
  void Function(DateTime?) onDateTimeTap;
  String? highlightTime;
  DateTime selectedDay;

  @override
  State<TimesView> createState() => _TimesViewState();
}

class _TimesViewState extends State<TimesView> {
  late DateTime selectedTime;

  List getFreeTimeListByDayIndex(int index) {
    if (index > -1) {
      return freeTime[index][1]
          .map(
            (e) => GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: ('${e.format(context)}' == widget.highlightTime) ? Colors.blueGrey[900]! : Colors.white,
                  color: () {
                    if ('${e.format(context)}' == widget.highlightTime) {
                      print('==');
                      print('${e.format(context)}');
                      print(widget.highlightTime);
                      return Colors.blueGrey[900]!;
                    } else {
                      print('!=');
                      print('${e.format(context)}');
                      print(widget.highlightTime);
                      return Colors.white;
                    }
                  }(),
                  border: Border.all(
                    color: Colors.blueGrey[800]!,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '${e.format(context)}',                                       // TODO Тут оставить так
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: ('${e.format(context)}' == widget.highlightTime) ? Colors.white : Colors.blueGrey[900]!,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              onTap: () {
                selectedTime = DateTime(widget.selectedDay.year, widget.selectedDay.month, widget.selectedDay.day, e.hour, e.minute);
                widget.onDateTimeTap(selectedTime);
                setState(() {
                  print('onTap');
                  print('${e.format(context)}');
                  print(widget.highlightTime);
                  widget.highlightTime = '${e.format(context)}';
                  print('${e.format(context)}');
                  print(widget.highlightTime);
                });
              },
            ),
          )
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: () {
        if (widget.selectedDayIndex > -1) {
          return <Widget>[...getFreeTimeListByDayIndex(widget.selectedDayIndex)];
        } else {
          return <Widget>[];
        }
      }(),
    );
  }
}