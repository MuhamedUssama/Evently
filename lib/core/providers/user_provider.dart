import 'package:evently/core/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}
