import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/login/provider/login_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({super.key});

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenProvider>(
      builder: (context, provider, child) {
        return Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                hintText: 'Email',
                controller: provider.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: SvgPicture.asset(
                  AppIcons.email,
                  fit: BoxFit.scaleDown,
                ),
                validator: (value) => AppValidator.validateEmail(value),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                hintText: 'Password',
                controller: provider.passwordController,
                keyboardType: TextInputType.visiblePassword,
                isPassword: !provider.isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: provider.togglePasswordVisibility,
                  icon: Icon(
                    provider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppTheme.grey,
                  ),
                ),
                prefixIcon: SvgPicture.asset(
                  AppIcons.password,
                  fit: BoxFit.scaleDown,
                ),
                validator: (value) => AppValidator.validatePassword(value),
              ),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Password?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(height: 8.h),
              CustomButton(
                onPressed: () {
                  if (provider.formKey.currentState!.validate()) {
                    // Perform login action
                  }
                },
                text: 'Login',
              ),
            ],
          ),
        );
      },
    );
  }
}
