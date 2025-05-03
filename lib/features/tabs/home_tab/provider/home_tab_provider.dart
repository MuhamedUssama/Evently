import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Event> events = [];

  HomeTabProvider() {
    getEvents();
  }

  void changeSelectedTab(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> getEvents() async {
    events = await FirebaseServices.getEventsFromFireStore();
    notifyListeners();
  }
}
