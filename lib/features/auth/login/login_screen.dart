import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/login/provider/login_screen_provider.dart';
import 'package:evently/features/auth/login/widgets/create_account_widget.dart';
import 'package:evently/features/auth/login/widgets/form_field_widget.dart';
import 'package:evently/features/auth/login/widgets/login_with_google.dart';
import 'package:evently/features/auth/login/widgets/or_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LoginScreenProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Image.asset(AppImages.logo, height: 186.h),
                  SizedBox(height: 24.h),
                  FormFieldWidget(),
                  SizedBox(height: 12.h),
                  CreateAccountWidget(),
                  SizedBox(height: 8.h),
                  OrWidget(),
                  SizedBox(height: 20.h),
                  LoginWithGoogle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
