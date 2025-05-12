import 'dart:developer';

import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  UserProvider() {
    getCurrentUser();
  }

  void updateCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    log('Getting current user');
    currentUser = await FirebaseServices.getCurrentUserData();
    log('Current user id: ${currentUser?.id}');
    notifyListeners();
  }
}
