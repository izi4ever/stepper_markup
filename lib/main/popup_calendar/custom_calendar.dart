import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class CustomCalendar extends StatefulWidget {
  CustomCalendar({Key? key}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  var _markedDateMap;
  late DateTime _currentDate;

  DateTime today() {                                                            // <<< Потому что now() ≠ сегодня
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  @override
  void initState() {
    _currentDate = today();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.grey[100],
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CalendarCarousel<Event>(
            onDayPressed: (DateTime date, List<Event> events) {
              setState(() => _currentDate = date);
            },
            customDayBuilder: (   /// you can provide your own build function to make custom day containers
              bool isSelectable,
              int index,
              bool isSelectedDay,
              bool isToday,
              bool isPrevMonthDay,
              TextStyle textStyle,
              bool isNextMonthDay,
              bool isThisMonthDay,
              DateTime day,
            ) {
                /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                /// This way you can build custom containers for specific days only, leaving rest as default.

                // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                // if (day.day == 15) {
                //   return Center(
                //     child: Icon(Icons.local_airport),
                //   );
                // } else {
                //   return null;
                // }
            },
            selectedDateTime: _currentDate,
            weekFormat: false,
            markedDatesMap: _markedDateMap,
            height: 350.0,
            daysHaveCircularBorder: true, /// null for not rendering any border, true for circular border, false for rectangular border
            todayButtonColor: Colors.transparent,
            todayBorderColor: Colors.blueGrey[900]!,
            todayTextStyle: TextStyle(
              color: (_currentDate == today()) ? Colors.white : Colors.black,
            ),
            selectedDayButtonColor: Colors.blueGrey[900]!,                        // <<< []!
            selectedDayBorderColor: Colors.transparent,                           // <<< color none
            weekendTextStyle: const TextStyle(
              color: Colors.black,
            ),
            weekdayTextStyle: TextStyle(
              fontWeight: FontWeight.w800,                                          // <<< .bold, w900
              color: Colors.blueGrey[900],
            ),
            headerTextStyle: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.w800,
            ),
            iconColor: Colors.blueGrey[900]!,
            firstDayOfWeek: 1,                                                  // <<< Надо запрограмировать из пресетов юзера
            headerMargin: const EdgeInsets.only(top: 0, bottom: 10),
            weekDayMargin: const EdgeInsets.only(bottom: 10),
            dayPadding: 1.0,
          ),
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 14,
              childAspectRatio: 2.5,
            ), 
            itemCount: 10,

            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey[900]!,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('${index + 5} PM')
                ),
                onTap: () {

                },
              );
            },
          ),
        ),
      ],
    );
  }
}