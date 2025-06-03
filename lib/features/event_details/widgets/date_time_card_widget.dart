import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/event_details/provider/event_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateTimeCardWidget extends StatelessWidget {
  final DateTime dateTime;
  const DateTimeCardWidget({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Icon(Icons.calendar_month_outlined, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Provider.of<EventDetailsProvider>(
                    context,
                    listen: false,
                  ).formatEventDate(dateTime),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  Provider.of<EventDetailsProvider>(
                    context,
                    listen: false,
                  ).formatEventTime(dateTime),
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
