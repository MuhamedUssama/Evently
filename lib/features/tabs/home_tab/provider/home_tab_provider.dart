import 'dart:developer';
import 'package:geocoding/geocoding.dart' as geocoding;

import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomeTabProvider with ChangeNotifier {
  int currentIndex = 0;

  List<Event> events = [];

  String categoryId = '1';

  Location location = Location();

  String? country;
  String? city;

  HomeTabProvider() {
    getEvents();
    getLocation();
  }

  void changeSelectedTab(int index) {
    currentIndex = index;
    categoryId = CategoryTabModel.tabs[currentIndex].id;
    getEvents();
    notifyListeners();
  }

  Future<void> getEvents() async {
    events = await FirebaseServices.getEventsFromFireStore(categoryId);
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

    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(
          locationData.latitude!,
          locationData.longitude!,
        );

    if (placemarks.isNotEmpty) {
      country = placemarks.first.country ?? 'Canot find country';
      city = placemarks.first.locality ?? 'Canot find city';
      log('country: $country');
      notifyListeners();
    }

    notifyListeners();
  }
}
