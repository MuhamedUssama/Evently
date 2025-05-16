import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/tabs/love_tab/provider/love_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchTextField extends StatelessWidget {
  final LoveTabProvider provider;

  const CustomSearchTextField({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: provider.searchController,
      onChanged: (value) {
        provider.searchEvents(value);
      },
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.grey,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
        decorationColor: Colors.transparent,
      ),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
