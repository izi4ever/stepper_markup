import 'package:flutter/material.dart';

class DateSlot {
  DateSlot(this.date, this.times);

  final DateTime date;
  final List<TimeOfDay> times;
}

final freeSlots = <DateSlot>[
  DateSlot(
    DateTime(2022, 07, 23),
    [
      const TimeOfDay(hour: 9, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
    ],
  ),
  DateSlot(
    DateTime(2022, 07, 25),
    [
      const TimeOfDay(hour: 10, minute: 00),
      const TimeOfDay(hour: 12, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
    ],
  ),
  DateSlot(
    DateTime(2022, 07, 26),
    [
      const TimeOfDay(hour: 14, minute: 00),
      const TimeOfDay(hour: 15, minute: 00),
      const TimeOfDay(hour: 16, minute: 00),
    ],
  ),
];