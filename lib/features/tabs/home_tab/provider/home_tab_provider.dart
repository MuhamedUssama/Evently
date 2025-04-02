import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeSelectedTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
