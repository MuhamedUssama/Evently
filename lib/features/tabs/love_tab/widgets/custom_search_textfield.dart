import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for event',
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: AppTheme.primary,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: SvgPicture.asset(AppSvgs.searchIcon, fit: BoxFit.scaleDown),
        prefixIconColor: AppTheme.primary,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.red),
          borderRadius: BorderRadius.circular(16.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.red),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
