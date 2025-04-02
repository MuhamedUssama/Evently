import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/auth/register/provider/register_screen_provider.dart';
import 'package:evently/features/auth/register/widgets/regiter_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => RegisterScreenProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Image.asset(AppImages.logo, height: 186.h),
                  SizedBox(height: 24.h),
                  RegiterFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
