import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/providers/user_provider.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/event_details/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCardWidget extends StatefulWidget {
  final Event event;

  const EventCardWidget({super.key, required this.event});

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget> {
  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    bool isFavourite = provider.checkIsEventFavourite(widget.event.id);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          EventDetailsScreen.routeName,
          arguments: widget.event,
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: LocalCachedImage(
              height: 200.h,
              width: double.infinity,
              imagePath: widget.event.category.lightImagePath!,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: .8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.event.dateTime.day}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        DateFormat('MMM').format(widget.event.dateTime),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Text(
                          widget.event.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (isFavourite) {
                            provider.removeEventFromFavourates(widget.event.id);
                          } else {
                            provider.addEventToFavourates(widget.event.id);
                          }

                          setState(() {});
                        },
                        child: Icon(
                          isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline_sharp,
                          color: AppTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
