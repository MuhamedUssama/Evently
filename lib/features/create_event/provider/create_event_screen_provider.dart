import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class CreateEventScreenProvider extends ChangeNotifier {
  int currentIndex = 1;
  int startIndex = 1;

  Location location = Location();

  late GoogleMapController googleMapController;

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};

  Event? eventModel;

  LatLng? eventLocation;

  String? city;
  String? country;

  CreateEventScreenProvider() {
    getLocation();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime? _selectedDate;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  TimeOfDay? _timeOfDay;

  TimeOfDay? get timeOfDay => _timeOfDay;
  set timeOfDay(TimeOfDay? newTime) {
    _timeOfDay = newTime;
    notifyListeners();
  }

  void onCategoryClicked(int index) {
    currentIndex = index + startIndex;
    notifyListeners();
  }

  String formatTimeOfDay(TimeOfDay time) {
    final int hour = time.hourOfPeriod;
    final int minute = time.minute;
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final String minuteFormatted = minute.toString().padLeft(2, '0');

    return '$hour:$minuteFormatted $period';
  }

  Future<void> createEvent() async {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        timeOfDay != null &&
        eventLocation != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        timeOfDay!.hour,
        timeOfDay!.minute,
      );

      Event event = Event(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
        category: CategoryTabModel.tabs[currentIndex],
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
        lat: eventLocation?.latitude ?? 0,
        long: eventLocation?.longitude ?? 0,
        city: city ?? 'Unknown',
        country: country ?? 'Unknown',
      );
      await FirebaseServices.addEventToFireStore(event);
    }
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

  void changeLocation(LatLng latLng) {
    eventLocation = latLng;
    markers.add(
      Marker(
        markerId: const MarkerId('2'),
        position: latLng,
        infoWindow: const InfoWindow(title: 'Event Location'),
      ),
    );
    notifyListeners();
  }

  Future<void> convertLatLongForEvent() async {
    if (eventLocation == null) return;

    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(
          eventLocation!.latitude,
          eventLocation!.longitude,
        );

    if (placemarks.isNotEmpty) {
      city = placemarks.first.locality ?? 'Unknown';
      country = placemarks.first.country ?? 'Unknown';
    }
    notifyListeners();
  }

  void initEventData(Event? event) {
    if (event != null) {
      eventModel = event;
      titleController.text = event.title;
      descriptionController.text = event.description;
      selectedDate = event.dateTime;
      timeOfDay = TimeOfDay.fromDateTime(event.dateTime);
      eventLocation = LatLng(event.lat, event.long);
      city = event.city;
      country = event.country;
      currentIndex = CategoryTabModel.tabs.indexWhere(
        (tab) => tab.id == event.category.id,
      );
    }
  }

  Future<void> updateEvent() async {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        timeOfDay != null &&
        eventLocation != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        timeOfDay!.hour,
        timeOfDay!.minute,
      );

      eventModel?.userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      eventModel?.category = CategoryTabModel.tabs[currentIndex];
      eventModel?.title = titleController.text;
      eventModel?.description = descriptionController.text;
      eventModel?.dateTime = dateTime;
      eventModel?.lat = eventLocation?.latitude ?? 0;
      eventModel?.long = eventLocation?.longitude ?? 0;
      eventModel?.city = city ?? 'Unknown';
      eventModel?.country = country ?? 'Unknown';

      await FirebaseServices.updateEvent(eventModel!);
    }
  }
}
