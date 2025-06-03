import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/event_details/provider/event_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TimeDateCardWidget extends StatelessWidget {
  final DateTime dateTime;
  const TimeDateCardWidget({super.key, required this.dateTime});

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
            child: Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.read<EventDetailsProvider>().formatDateToCustomString(
                    dateTime,
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppTheme.primary),
                ),
                Text(
                  context.read<EventDetailsProvider>().formatTimeTo12Hour(
                    dateTime,
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppTheme.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
