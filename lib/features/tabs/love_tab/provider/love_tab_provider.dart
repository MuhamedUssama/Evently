import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoveTabProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<Event> favoriteEvents = [];

  LoveTabProvider() {
    getFavoriteEvents();
  }

  Future<void> getFavoriteEvents() async {
    favoriteEvents = await FirebaseServices.getFavoriteEvents();
    notifyListeners();
  }
}
