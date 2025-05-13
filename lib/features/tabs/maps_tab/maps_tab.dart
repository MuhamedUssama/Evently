import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapsTab extends StatelessWidget {
  const MapsTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapsTabProvider provider = Provider.of<MapsTabProvider>(context);
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
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.getLocation();
        },
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: AppTheme.backgroundLight,
        child: Icon(Icons.gps_fixed),
      ),
    );
  }
}
