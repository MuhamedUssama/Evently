import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  int startIndex = 1;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? _selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

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

  Future<void> createEvent() async {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        timeOfDay != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        timeOfDay!.hour,
        timeOfDay!.minute,
      );

      Event event = Event(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
        category: CategoryTabModel.tabs[currentIndex],
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
      );
      await FirebaseServices.addEventToFireStore(event);
    }
  }
}
