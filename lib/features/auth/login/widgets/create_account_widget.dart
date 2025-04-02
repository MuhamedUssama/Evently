import 'package:evently/features/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t Have Account ?',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
          },
          child: Text(
            'Create Account',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
