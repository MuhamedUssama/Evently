import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateAndTimeWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String buttonTitle;
  final Function onPressed;

  const CustomDateAndTimeWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Icon(icon, color: AppTheme.black),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            buttonTitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              color: AppTheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
