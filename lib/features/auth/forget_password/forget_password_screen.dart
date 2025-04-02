import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/forget_password/provider/forget_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/forget-password';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        titleTextStyle: Theme.of(
          context,
        ).appBarTheme.titleTextStyle?.copyWith(color: AppTheme.black),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ForgetPasswordProvider(),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              spacing: 24.h,
              children: [
                SvgPicture.asset(AppSvgs.forgetPassword),
                CustomTextFormField(
                  controller: context.read<ForgetPasswordProvider>().controller,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.email,
                    fit: BoxFit.scaleDown,
                  ),
                  validator: (value) => AppValidator.validateEmail(value),
                ),
                CustomButton(onPressed: () {}, text: 'Reset Password'),
              ],
            ),
          );
        },
      ),
    );
  }
}
