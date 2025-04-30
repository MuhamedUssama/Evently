import 'package:flutter/material.dart';

class CreateEventScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  int startIndex = 1;

  void onCategoryClicked(int index) {
    currentIndex = index + startIndex;
    notifyListeners();
  }
}
