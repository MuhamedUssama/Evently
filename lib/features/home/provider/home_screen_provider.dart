import 'package:evently/features/tabs/home_tab/home_tab.dart';
import 'package:evently/features/tabs/love_tab/love_tab.dart';
import 'package:evently/features/tabs/maps_tab/maps_tab.dart';
import 'package:evently/features/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> tabs = [HomeTab(), MapsTab(), LoveTab(), ProfileTab()];

  void chageTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
