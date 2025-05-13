import 'dart:developer';

import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class LoginScreenProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  Future<bool> login() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseServices.login(
          email: emailController.text,
          password: passwordController.text,
        );
        return true;
      } catch (error) {
        log('Registration error: $error');
        return false;
      }
    }
    return false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
