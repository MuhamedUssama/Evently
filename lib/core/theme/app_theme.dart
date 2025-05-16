import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0XFF5669FF);
  static const Color backgroundLight = Color(0XFFF2FEFF);
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF1C1C1C);
  static const Color grey = Color(0XFF7B7B7B);
  static const Color red = Color(0XFFFF5659);

  static const Color backgroundDark = Color(0XFF101127);
  static const Color whiteDark = Color(0XFFF4EBDC);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,

    indicatorColor: primary,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary.withValues(alpha: .5),
      selectionHandleColor: primary,
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: primary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.inter(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      bodyLarge: GoogleFonts.inter(
        color: primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: primary,
      ),
      labelLarge: GoogleFonts.inter(
        color: white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusColor: primary,
      suffixIconColor: grey,
      prefixIconColor: grey,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: grey),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundLight,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: primary,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: primary),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: backgroundLight,
      headerBackgroundColor: backgroundLight,
      todayBorder: BorderSide(color: primary, width: 1),
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: primary),
      confirmButtonStyle: TextButton.styleFrom(foregroundColor: primary),
      dayStyle: GoogleFonts.inter(
        color: black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      weekdayStyle: GoogleFonts.inter(
        color: black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      yearStyle: GoogleFonts.inter(
        color: grey,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      dividerColor: grey,
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primary;
        }
        return Colors.transparent;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return backgroundLight;
        }
        return black;
      }),
      yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primary;
        }
        return Colors.transparent;
      }),
      yearForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return backgroundLight;
        }
        return black;
      }),
    ),

    timePickerTheme: TimePickerThemeData(
      backgroundColor: backgroundLight,
      hourMinuteTextColor: black,
      dialBackgroundColor: Colors.grey[200],
      dialHandColor: primary,
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: primary),
      confirmButtonStyle: TextButton.styleFrom(foregroundColor: primary),
      dayPeriodTextStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      dialTextStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: black,
        decoration: TextDecoration.none,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: backgroundLight,
      unselectedItemColor: backgroundLight,
      enableFeedback: false,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundDark,

    indicatorColor: primary,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary.withValues(alpha: .5),
      selectionHandleColor: primary,
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        color: primary,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.inter(
        color: whiteDark,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: whiteDark,
      ),
      bodyLarge: GoogleFonts.inter(
        color: primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: primary,
      ),
      labelLarge: GoogleFonts.inter(
        color: white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusColor: primary,
      suffixIconColor: whiteDark,
      prefixIconColor: whiteDark,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: whiteDark,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: whiteDark),
        borderRadius: BorderRadius.circular(16.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteDark),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: whiteDark),
        borderRadius: BorderRadius.circular(16.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDark,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: primary,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: primary),
    ),
  );
}
