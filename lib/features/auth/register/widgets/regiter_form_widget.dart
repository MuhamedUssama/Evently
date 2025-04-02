import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/auth/register/provider/register_screen_provider.dart';
import 'package:evently/features/auth/register/widgets/already_have_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegiterFormWidget extends StatelessWidget {
  const RegiterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterScreenProvider>(
      builder: (context, provider, child) {
        return Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: provider.formKey,
              child: Column(
                spacing: 16.h,
                children: [
                  CustomTextFormField(
                    controller: provider.nameController,
                    hintText: 'Name',
                    prefixIcon: SvgPicture.asset(
                      AppIcons.name,
                      fit: BoxFit.scaleDown,
                    ),
                    keyboardType: TextInputType.name,
                    validator:
                        (value) => AppValidator.validateNotEmptyField(value),
                  ),
                  CustomTextFormField(
                    controller: provider.emailController,
                    hintText: 'Email',
                    prefixIcon: SvgPicture.asset(
                      AppIcons.email,
                      fit: BoxFit.scaleDown,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => AppValidator.validateEmail(value),
                  ),
                  CustomTextFormField(
                    controller: provider.passwordController,
                    hintText: 'Password',
                    prefixIcon: SvgPicture.asset(
                      AppIcons.password,
                      fit: BoxFit.scaleDown,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: provider.obscurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.togglePassword();
                      },
                      icon: Icon(
                        provider.obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: (value) => AppValidator.validatePassword(value),
                  ),
                  CustomTextFormField(
                    controller: provider.rePasswordController,
                    hintText: 'Re Password',
                    prefixIcon: SvgPicture.asset(
                      AppIcons.password,
                      fit: BoxFit.scaleDown,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: provider.obscureRePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.toggleRePassword();
                      },
                      icon: Icon(
                        provider.obscureRePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: (value) => provider.validateRePassword(value),
                  ),
                ],
              ),
            ),
            CustomButton(onPressed: () {}, text: 'Create Account'),
            AlreadyHaveAccountWidget(),
          ],
        );
      },
    );
  }
}
