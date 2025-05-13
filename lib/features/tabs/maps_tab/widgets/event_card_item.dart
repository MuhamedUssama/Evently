import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventCardItem extends StatefulWidget {
  final Event event;
  final MapsTabProvider provider;

  const EventCardItem({super.key, required this.event, required this.provider});

  @override
  State<EventCardItem> createState() => _EventCardItemState();
}

class _EventCardItemState extends State<EventCardItem> {
  @override
  void initState() {
    super.initState();
    widget.provider.convertLatLong(LatLng(widget.event.lat, widget.event.long));
  }

  @override
  Widget build(BuildContext context) {
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
                imagePath: widget.event.category.lightImagePath!,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.event.title,
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
                    '${widget.provider.city}, ${widget.provider.country}',
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
