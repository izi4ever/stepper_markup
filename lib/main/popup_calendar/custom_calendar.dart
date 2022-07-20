import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:google_fonts/google_fonts.dart';

import 'free_time_list.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    required this.onDateTimeTap,
    Key? key,
  }) : super(key: key);

  final void Function(DateTime) onDateTimeTap;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int selectedDayIndex = -1;
  late DateTime selectedTime;
  String highlightTime = '';
  late DateTime _currentDate;

  DateTime today() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    _currentDate = today();
    getDataFromInputList();
    selectedDayIndex;

    super.initState();
  }

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  void getDataFromInputList() {
    for (int i = 0; i < freeTime.length; i++) {
      if (freeTime[i][0] == today()) {
        selectedDayIndex = i;
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

  List getFreeTimeListByDayIndex(int index) {
    if (index > -1) {
      return freeTime[index][1]
          .map(
            (e) => GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ('${e.format(context)}' == highlightTime) ? Colors.blueGrey[900]! : Colors.white,
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
                      color: ('${e.format(context)}' == highlightTime) ? Colors.white : Colors.blueGrey[900]!,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              onTap: () {
                selectedTime = DateTime(_currentDate.year, _currentDate.month, _currentDate.day, e.hour, e.minute);
                widget.onDateTimeTap(selectedTime);
                setState(() {
                  highlightTime = '${e.format(context)}';
                });
              },
            ),
          )
          .toList();
    } else {
      return [];
    }
  }

  static Widget freeDayIcon(String day) => CircleAvatar(
        backgroundColor: const Color(0xFFDCE2E8),
        child: Text(day, style: const TextStyle(color: Colors.black, fontSize: 14)),
      );

  late CalendarCarousel _calendarCarouselNoHeader;

  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: 350.0,
      daysHaveCircularBorder: true,
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          _currentDate = date;
          highlightTime = '';
          
          if (events.isNotEmpty) {
            selectedDayIndex = events[0].id!;
          } else {
            selectedDayIndex = -1;
          }
        });
      },
      selectedDateTime: _currentDate,
      selectedDayButtonColor: Colors.blueGrey[900]!,
      selectedDayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.blueGrey[900]!,
      todayTextStyle: TextStyle(
        color: (_currentDate == today()) ? Colors.white : Colors.black,
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

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _calendarCarouselNoHeader,
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
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: () {
              if (selectedDayIndex > -1) {
                return <Widget>[...getFreeTimeListByDayIndex(selectedDayIndex)];
              } else {
                return <Widget>[];
              }
            }(),
          ),
        ),
      ],
    );
  }
}
