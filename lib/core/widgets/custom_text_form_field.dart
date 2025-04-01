import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      cursorRadius: Radius.circular(1000),
      style: Theme.of(context).textTheme.labelMedium,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
