import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  int startIndex = 1;

  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  void onCategoryClicked(int index) {
    currentIndex = index + startIndex;
    notifyListeners();
  }
}
