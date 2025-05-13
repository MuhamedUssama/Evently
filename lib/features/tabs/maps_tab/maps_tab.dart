import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:evently/features/tabs/maps_tab/widgets/event_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapsTab extends StatelessWidget {
  const MapsTab({super.key});

  @override
  Widget build(BuildContext context) {
    MapsTabProvider provider = Provider.of<MapsTabProvider>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
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
          SizedBox(
            height: 160,
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    provider.changCameraPosition(
                      LatLng(
                        provider.events[index].lat,
                        provider.events[index].long,
                      ),
                      provider.events[index].title,
                    );
                  },
                  child: EventCardItem(
                    event: provider.events[index],
                    provider: provider,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 16.h),
              itemCount: provider.events.length,
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
