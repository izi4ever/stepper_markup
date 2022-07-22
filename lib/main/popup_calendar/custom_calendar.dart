import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String? highlightTime;
  int selectedDayIndex = -1;

  DateTime getToday() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  late DateTime today;
  late DateTime selectedDay;

  @override
  void initState() {
    selectedDay = getToday();
    today = getToday();
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
            highlightTimeValue: (String? value) {
              setState(() {
                highlightTime = value;
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
            // selectedDay: selectedDay,
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
            highlightTime: highlightTime, 
            selectedDay: selectedDay,
          ),
        ),
      ],
    );
  }
}
