import 'dart:developer';

import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';

class RegisterScreenProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureRePassword = true;

  Future<bool> register() async {
    if (formKey.currentState!.validate()) {
      try {
        FirebaseServices.register(
          name: nameController.text,
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

  String? validateRePassword(String? value) {
    if (passwordController.text != value) {
      return "Password don't match";
    }
    return null;
  }

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleRePassword() {
    obscureRePassword = !obscureRePassword;
    notifyListeners();
  }
}
