import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLocationButton extends StatelessWidget {
  final Function onPressed;
  const ChooseLocationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.backgroundLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: AppTheme.primary),
        ),
        minimumSize: Size(double.infinity, 64.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.gps_fixed_rounded,
                  color: AppTheme.backgroundLight,
                ),
              ),
              Text(
                'Choose Event Location',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.primary),
        ],
      ),
    );
  }
}
