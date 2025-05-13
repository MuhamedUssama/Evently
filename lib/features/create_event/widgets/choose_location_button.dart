import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/create_event/provider/create_event_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseLocationButton extends StatelessWidget {
  final Function onPressed;
  final CreateEventScreenProvider provider;
  const ChooseLocationButton({
    super.key,
    required this.onPressed,
    required this.provider,
  });

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
          Expanded(
            child: Row(
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
                Expanded(
                  child: Text(
                    provider.eventLocation == null
                        ? 'Choose Event Location'
                        : 'Location: ${provider.eventLocation?.latitude.floor()}, ${provider.eventLocation?.longitude.floor()}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.primary),
        ],
      ),
    );
  }
}
