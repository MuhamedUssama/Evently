import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  int startIndex = 1;

  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  TimeOfDay? _timeOfDay;

  TimeOfDay? get timeOfDay => _timeOfDay;

  set timeOfDay(TimeOfDay? newTime) {
    _timeOfDay = newTime;
    notifyListeners();
  }

  void onCategoryClicked(int index) {
    currentIndex = index + startIndex;
    notifyListeners();
  }

  String formatTimeOfDay(TimeOfDay time) {
    final int hour = time.hourOfPeriod;
    final int minute = time.minute;
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final String minuteFormatted = minute.toString().padLeft(2, '0');

    return '$hour:$minuteFormatted $period';
  }
}
