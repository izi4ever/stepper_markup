import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'free_time_list.dart';

class MonthView extends StatefulWidget {
  MonthView({
    Key? key,
    required this.selectedTimeValue,
    required this.selectedDayID,
    required this.selectedDay,
    required this.today,
  }) : super(key: key);

  void Function(DateTime?) selectedTimeValue;
  void Function(int) selectedDayID;
  final void Function(DateTime) selectedDay;
  DateTime today;

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  late DateTime _currentDate;

  @override
  initState() {
    _currentDate = widget.today;
    getDataFromInputList();

    super.initState();
  }

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  Widget freeDayIcon(String day) => CircleAvatar(
        backgroundColor: const Color(0xFFDCE2E8),
        child: Text(day, style: const TextStyle(color: Colors.black, fontSize: 14)),
      );

  getDataFromInputList() {
    for (int i = 0; i < freeSlots.length; i++) {                 // During first loading don't load hours if today has it
      final date = freeSlots[i].date;
      _markedDateMap.add(
        date,
        Event(
          id: i,
          date: date,
          icon: freeDayIcon(
            date.day.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      height: 350.0,
      daysHaveCircularBorder: true,
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          _currentDate = date;
          widget.selectedDay(date);
          widget.selectedTimeValue(null);
          
          if (events.isNotEmpty) {
            widget.selectedDayID(events[0].id!);
          } else {
            widget.selectedDayID(-1);
          }
        });
      },
      selectedDateTime: _currentDate,
      selectedDayButtonColor: Colors.blueGrey[900]!,
      selectedDayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.blueGrey[900]!,
      todayTextStyle: TextStyle(
        color: (_currentDate == widget.today) ? Colors.white : Colors.black,
      ),
      weekDayMargin: const EdgeInsets.only(bottom: 10),
      firstDayOfWeek: MaterialLocalizations.of(context).firstDayOfWeekIndex,
      weekFormat: false,
      weekendTextStyle: const TextStyle(
        color: Colors.black,
      ),
      weekdayTextStyle: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blueGrey[900],
      ),
      headerTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.blueGrey[900],
        fontWeight: FontWeight.w800,
      ),
      iconColor: Colors.blueGrey[900]!,
      headerMargin: const EdgeInsets.only(top: 0, bottom: 10),
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      showOnlyCurrentMonthDate: true,
      dayPadding: 0,
    );
  }
}