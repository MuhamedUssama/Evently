import 'package:evently/features/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Have Account ?',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
          child: Text('Login', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
