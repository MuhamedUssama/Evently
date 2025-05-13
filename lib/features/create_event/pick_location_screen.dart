import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/create_event/provider/create_event_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocationScreen extends StatelessWidget {
  static const String routeName = '/pickLocation';
  final CreateEventScreenProvider provider;
  const PickLocationScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: provider.cameraPosition,
              onMapCreated: (controller) {
                provider.googleMapController = controller;
              },
              mapType: MapType.normal,
              markers: provider.markers,
              onTap: (latLag) {
                provider.changeLocation(latLag);
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: AppTheme.primary,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              'Tap on Location To Select',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
