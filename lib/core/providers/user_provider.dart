import 'dart:developer';

import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  UserProvider() {
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    log('Getting current user');
    currentUser = await FirebaseServices.getCurrentUserData();
    log('Current user id: ${currentUser?.id}');
    notifyListeners();
  }

  bool checkIsEventFavourite(String eventId) {
    return currentUser!.favourateEventsIds.contains(eventId);
  }

  Future<void> addEventToFavourates(String eventId) async {
    if (currentUser != null) {
      currentUser!.favourateEventsIds.add(eventId);
      await FirebaseServices.addEventToFavourate(eventId);
    }
  }

  Future<void> removeEventFromFavourates(String eventId) async {
    if (currentUser != null) {
      currentUser!.favourateEventsIds.remove(eventId);
      await FirebaseServices.removeEventFromFavourate(eventId);
    }
  }
}
