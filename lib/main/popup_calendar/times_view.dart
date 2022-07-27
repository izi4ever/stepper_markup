import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'free_time_list.dart';

class TimesView extends StatefulWidget {
  TimesView({
    Key? key,
    required this.selectedDayIndex,
    required this.onDateTimeTap,
    // required this.highlightTime,
    required this.selectedDay,
  }) : super(key: key);

  int selectedDayIndex;
  void Function(DateTime?) onDateTimeTap;
  // TimeOfDay? highlightTime;
  DateTime selectedDay;

  @override
  State<TimesView> createState() => _TimesViewState();
}

class _TimesViewState extends State<TimesView> {
  late DateTime selectedTime;
  TimeOfDay? highlightTime;
  DateTime? newSelectedDay;

  List getFreeTimeListByDayIndex(int index) {
    if (newSelectedDay != widget.selectedDay) {
      highlightTime = null;
      newSelectedDay = widget.selectedDay;
    } 

    if (index > -1) {
      return freeSlots[index].times
          .map(
            (e) => GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (e == highlightTime) ? Colors.blueGrey[900]! : Colors.white,
                  border: Border.all(
                    color: Colors.blueGrey[800]!,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  '${e.format(context)}',
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: (e == highlightTime) ? Colors.white : Colors.blueGrey[900]!,
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
                  highlightTime = e;
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
    // highlightTime = null;
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