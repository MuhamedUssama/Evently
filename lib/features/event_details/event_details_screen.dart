import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/event_details/widgets/location_card_widget.dart';
import 'package:evently/features/event_details/widgets/time_date_card_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = '/event-details';
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        actions: [
          Visibility(
            visible: FirebaseAuth.instance.currentUser?.uid == event.userId,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          ),
          Visibility(
            visible: FirebaseAuth.instance.currentUser?.uid == event.userId,
            child: IconButton(
              onPressed: () async {
                await FirebaseServices.deleteEvent(event.id);

                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: LocalCachedImage(
                height: 200.h,
                width: double.infinity,
                imagePath: event.category.lightImagePath ?? '',
              ),
            ),
            Text(
              event.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
            ),
            TimeDateCardWidget(dateTime: event.dateTime),
            LocationCardWidget(country: event.country, city: event.city),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.34,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(event.lat, event.long),
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(event.lat, event.long),
                      infoWindow: InfoWindow(
                        title: event.title,
                        snippet: '${event.city}, ${event.country}',
                      ),
                    ),
                  },
                ),
              ),
            ),
            Text(
              'Description',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppTheme.black),
            ),
            Text(
              event.description,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppTheme.black),
            ),
          ],
        ),
      ),
    );
  }
}
