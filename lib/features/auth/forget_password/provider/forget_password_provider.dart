import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void resetPassword(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      try {
        await FirebaseServices.resetPassword(controller.text);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset email sent successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: AppTheme.red,
            ),
          );
        }
      }
    }
  }
}
