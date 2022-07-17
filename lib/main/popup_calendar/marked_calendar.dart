import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'free_time_list.dart';

class MarkedCalendar extends StatefulWidget {
  MarkedCalendar({Key? key}) : super(key: key);

  @override
  State<MarkedCalendar> createState() => _MarkedCalendarState();
}

class _MarkedCalendarState extends State<MarkedCalendar> {

  int selectedDayIndex = -1;
  late DateTime selectedTime;

  late DateTime _currentDate;

  DateTime today() {                                                            // <<< Потому что now() ≠ сегодня
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    _currentDate = today();

    getDataFromInputList();
    selectedDayIndex;
    print(selectedDayIndex);
    // getFreeTimeListByDayIndex(selectedDayIndex);

    super.initState();
  }

  void getDataFromInputList() {

    for (int i = 0; i < freeTime.length; i++) {
      if (freeTime[i][0] == today()) { 
        selectedDayIndex = i;
        // setState(() {
        //   selectedDayIndex = i;
        // });
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

    // freeTime.map(
    //   (e) => _markedDateMap.add(
    //     e[e.index][0], 
    //     Event(
    //       date: e[e.index][0], 
    //       icon: freeDayIcon(
    //         e[e.index][0].day.toString(),
    //       ),
    //     ),
    //   ),
    // ).toList();

  }


  List getFreeTimeListByDayIndex(int index) {
    if (index > -1) {
      return freeTime[index][1].map(
        (e) => GestureDetector(
          child: Container(
            alignment: Alignment.center,
            // color: (e.index == selectedDayIndex) ? Colors.blueGrey[900] : Colors.white,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey[900]!,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              '${e.format(context)}', 
              // style: TextStyle(
              //   color: (e.index == selectedDayIndex) ? Colors.white : Colors.blueGrey[900],
              // ),
            ),
          ),
          onTap: () {
            selectedTime = DateTime(_currentDate.year, _currentDate.month, _currentDate.day, e.hour, e.minute);    // <<< Как конвертировать
            print(selectedTime);

            // print(e.index);
            // setState(() {
            //   selectedDayIndex = e.index;
            // });
          },
        ),
      ).toList();
    } else {
      return [];
    }

  }

  static Widget freeDayIcon(String day) => CircleAvatar(
    backgroundColor: const Color(0xFFDCE2E8),
    child: Text(day, style: const TextStyle(color: Colors.black, fontSize: 14)),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;


  @override
  Widget build(BuildContext context) {

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: 350.0,
      daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          _currentDate = date;
          if (events.isNotEmpty) {
            selectedDayIndex = events[0].id!;
          } else {
            selectedDayIndex = -1;
          }
        });
      },
      selectedDateTime: _currentDate,
      selectedDayButtonColor: Colors.blueGrey[900]!,                          // <<< []!
      selectedDayBorderColor: Colors.transparent,                             // <<< color none
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.blueGrey[900]!,
      todayTextStyle: TextStyle(
        color: (_currentDate == today()) ? Colors.white : Colors.black,
      ),
      weekDayMargin: const EdgeInsets.only(bottom: 10),
      firstDayOfWeek: 1,                                                        // <<< Надо запрограмировать из пресетов юзера
      weekFormat: false,
      weekendTextStyle: const TextStyle(
        color: Colors.black,
      ),
      weekdayTextStyle: TextStyle(
        fontWeight: FontWeight.w800,                                            // <<< .bold, w900
        color: Colors.blueGrey[900],
      ),
      headerTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.blueGrey[900],
        fontWeight: FontWeight.w800,
      ),
      iconColor: Colors.blueGrey[900]!,                                       // <<< Стрелки листания месяцев
      headerMargin: const EdgeInsets.only(top: 0, bottom: 10),
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      // markedDateCustomShapeBorder: CircleBorder(side: BorderSide(width: 3, color: Color(0xFFDCE2E8))),
      dayPadding: 0,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _calendarCarouselNoHeader,
        ),
        Container(
          alignment: Alignment.topLeft,                                         // <<< По центру был не текст, а весь виджет Text
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 11),
          child: Text(
            'Available time'.toUpperCase(),                                     // <<< UPPERCASE
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
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
            // children: [...getFreeTimeListByDayIndex(selectedDayIndex)],
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