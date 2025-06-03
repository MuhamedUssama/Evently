import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/create_event/create_event_screen.dart';
import 'package:evently/features/event_details/widgets/date_time_card_widget.dart';
import 'package:evently/features/event_details/widgets/location_card_widget.dart';
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
            visible: event.userId == FirebaseAuth.instance.currentUser?.uid,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CreateEventScreen.routeName,
                  arguments: event,
                );
              },
              icon: Icon(Icons.edit),
            ),
          ),
          Visibility(
            visible: event.userId == FirebaseAuth.instance.currentUser?.uid,
            child: IconButton(
              onPressed: () async {
                await FirebaseServices.deleteEvent(event.id);

                // ignore: use_build_context_synchronously
                Navigator.pop(context);
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
                imagePath: event.category.lightImagePath!,
                width: double.infinity,
                height: 200.h,
              ),
            ),
            Text(
              event.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 24.sp,
              ),
            ),
            DateTimeCardWidget(dateTime: event.dateTime),
            LocationCardWidget(city: event.city, country: event.country),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.34,
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
                  scrollGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(event.lat, event.long),
                    zoom: 14.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('event_location'),
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
