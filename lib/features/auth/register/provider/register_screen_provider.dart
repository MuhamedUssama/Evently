import 'package:flutter/material.dart';

class RegisterScreenProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureRePassword = true;

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
