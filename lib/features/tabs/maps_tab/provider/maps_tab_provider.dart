import 'dart:developer';

import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsTabProvider extends ChangeNotifier {
  Location location = Location();

  late GoogleMapController googleMapController;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  MapsTabProvider() {
    getEvents();
  }

  Set<Marker> markers = {};

  List<Event> events = [];

  Future<void> getEvents() async {
    events = await FirebaseServices.getEventsFromFireStore('1');
    notifyListeners();
  }

  Future<bool> _getLocationPermissioin() async {
    PermissionStatus permissionStatus;

    permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    return serviceEnabled;
  }

  Future<void> getLocation() async {
    bool permissionGranted = await _getLocationPermissioin();
    if (!permissionGranted) {
      return;
    }

    bool serviceEnabled = await _checkLocationService();
    if (!serviceEnabled) {
      return;
    }

    LocationData locationData = await location.getLocation();

    changeLocationOnMap(locationData);

    notifyListeners();
  }

  void changeLocationOnMap(LocationData locationData) {
    cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      zoom: 14.4746,
    );

    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          locationData.latitude ?? 0,
          locationData.longitude ?? 0,
        ),
        infoWindow: InfoWindow(title: 'User Location'),
      ),
    );

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );

    notifyListeners();
  }

  void setLocationListener() {
    location.changeSettings(accuracy: LocationAccuracy.high, interval: 1000);

    location.onLocationChanged.listen((LocationData currentLocation) {
      changeLocationOnMap(currentLocation);
      notifyListeners();
    });
  }

  void changCameraPosition(LatLng latLng, String title) {
    cameraPosition = CameraPosition(target: latLng, zoom: 14.4746);

    markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: LatLng(latLng.latitude, latLng.longitude),
        infoWindow: InfoWindow(title: title),
      ),
    );

    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );

    notifyListeners();
  }

  String? country;
  String? city;

  Future<void> convertLatLong(LatLng latLng) async {
    try {
      List<geocoding.Placemark> placemarks = await geocoding
          .placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      if (placemarks.isNotEmpty) {
        country = placemarks.first.country ?? 'Canot find country';
        city = placemarks.first.locality ?? 'Canot find city';
        log('city: $city');
        notifyListeners();
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
