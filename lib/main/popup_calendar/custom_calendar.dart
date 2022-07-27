import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepper_markup/main/popup_calendar/free_time_list.dart';
import 'package:stepper_markup/main/popup_calendar/month_view.dart';
import 'package:stepper_markup/main/popup_calendar/times_view.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    required this.onDateTimeTap,
    Key? key,
  }) : super(key: key);

  final void Function(DateTime?) onDateTimeTap;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int selectedDayIndex = -1;

  late DateTime today;
  late DateTime selectedDay;

  @override
  void initState() {
    final now = DateTime.now();
    final nowRaw = DateTime(now.year, now.month, now.day);
    selectedDay = nowRaw;
    today = nowRaw;
    selectedDayIndex = freeSlots.indexWhere((DateSlot element) => element.date == nowRaw);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: MonthView(
            selectedTimeValue: (DateTime? value) {
              setState(() {
                widget.onDateTimeTap(value);
              });
            },
            selectedDayID: (int value) {
              setState(() {
                selectedDayIndex = value;
              });
            },
            selectedDay: (DateTime value) {
              setState(() {
                selectedDay = value;
              });
            },
            today: today,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 11),
          child: Text(
            'Available time'.toUpperCase(),
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
        ),
        Container(
          height: 120,
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: TimesView(
            selectedDayIndex: selectedDayIndex, 
            onDateTimeTap: (DateTime? value) {
              setState(() {
                widget.onDateTimeTap(value);
              });
            }, 
            selectedDay: selectedDay,
          ),
        ),
      ],
    );
  }
}
