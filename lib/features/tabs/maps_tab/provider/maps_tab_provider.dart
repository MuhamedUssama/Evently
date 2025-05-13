import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapsTabProvider extends ChangeNotifier {
  Location location = Location();
  String locationMessage = '';

  MapsTabProvider() {
    getLocation();
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
      locationMessage = 'Location Permission denied';
      notifyListeners();
      return;
    }

    bool serviceEnabled = await _checkLocationService();
    if (!serviceEnabled) {
      locationMessage = 'Location service disabled';
      notifyListeners();
      return;
    }

    locationMessage =
        'Location service enabled and now we are getting location';
    notifyListeners();

    LocationData locationData = await location.getLocation();

    locationMessage =
        'Location: ${locationData.latitude}, ${locationData.longitude}';
    notifyListeners();
  }
}
