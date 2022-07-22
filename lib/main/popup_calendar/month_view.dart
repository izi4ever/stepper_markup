import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

import 'free_time_list.dart';

class MonthView extends StatefulWidget {
  MonthView({
    Key? key,
    required this.selectedTimeValue,
    // required this.highlightTimeValue,
    required this.selectedDayID,
    required this.selectedDay,
    required this.today,
  }) : super(key: key);

  void Function(DateTime?) selectedTimeValue;
  // void Function(TimeOfDay?) highlightTimeValue;
  void Function(int) selectedDayID;
  final void Function(DateTime) selectedDay;
  // DateTime selectedDay;
  DateTime today;

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  late DateTime _currentDate;

  @override
  void initState() {
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

  void getDataFromInputList() {
    for (int i = 0; i < freeTime.length; i++) {
      if (freeTime[i][0] == widget.today) {
        widget.selectedDayID(i);
      }
      _markedDateMap.add(
        freeTime[i][0],
        Event(
          id: i,
          date: freeTime[i][0],
          icon: freeDayIcon(
            freeTime[i][0].day.toString(),
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
          // widget.selectedDay(_currentDate);
          widget.selectedTimeValue(null);
          // widget.highlightTimeValue(null);
          
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
      dayPadding: 0,
    );
  }
}