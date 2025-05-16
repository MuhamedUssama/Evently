import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoveTabProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<Event> favoriteEvents = [];
  List<Event> filteredFavoriteEvents = [];

  LoveTabProvider() {
    getFavoriteEvents();
  }

  Future<void> getFavoriteEvents() async {
    favoriteEvents = await FirebaseServices.getFavoriteEvents();
    filteredFavoriteEvents = favoriteEvents;

    notifyListeners();
  }

  void searchEvents(String query) {
    filteredFavoriteEvents =
        favoriteEvents.where((event) {
          String titleLower = event.title.toLowerCase();
          String descriptionLower = event.description.toLowerCase();
          String queryLower = query.toLowerCase();

          return titleLower.contains(queryLower) ||
              descriptionLower.contains(queryLower);
        }).toList();

    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
