import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCardWidget extends StatelessWidget {
  final String country;
  final String city;
  const LocationCardWidget({
    super.key,
    required this.country,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 12.w,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.gps_fixed, color: Colors.white, size: 24.sp),
          ),
          Text(
            '$city, $country',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppTheme.primary),
          ),
        ],
      ),
    );
  }
}
