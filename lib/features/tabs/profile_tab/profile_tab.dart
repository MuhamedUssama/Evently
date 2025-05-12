import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/tabs/profile_tab/widgets/profile_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTabHeader(),
        Spacer(),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await FirebaseServices.logout();
                  Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    LoginScreen.routeName,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.red,
                  foregroundColor: AppTheme.white,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.logout_outlined),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
