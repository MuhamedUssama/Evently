import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:flutter/material.dart';

class EventCardItem extends StatelessWidget {
  final Event event;
  final MapsTabProvider provider;

  const EventCardItem({super.key, required this.event, required this.provider});

  @override
  Widget build(BuildContext context) {
    String city = provider.locationData[event.id]?['city'] ?? 'Loading..';
    String country = provider.locationData[event.id]?['country'] ?? 'Loading..';
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.backgroundLight,
        border: Border.all(color: AppTheme.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 8,
        children: [
          AspectRatio(
            aspectRatio: 138 / 78,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LocalCachedImage(
                imagePath: event.category.lightImagePath!,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppTheme.black,
                    size: 24,
                  ),
                  Text(
                    '$city, $country',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: AppTheme.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
