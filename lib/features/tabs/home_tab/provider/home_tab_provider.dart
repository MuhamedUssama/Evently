import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeTabProvider with ChangeNotifier {
  int currentIndex = 0;

  List<Event> events = [];

  String categoryId = '1';

  HomeTabProvider() {
    getEvents();
  }

  void changeSelectedTab(int index) {
    currentIndex = index;
    categoryId = CategoryTabModel.tabs[currentIndex].id;
    getEvents();
    notifyListeners();
  }

  Future<void> getEvents() async {
    events = await FirebaseServices.getEventsFromFireStore(categoryId);
    notifyListeners();
  }
}
