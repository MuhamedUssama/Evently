import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailsProvider extends ChangeNotifier {
  String formatDateToCustomString(DateTime dateTime) {
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    return formatter.format(dateTime);
  }

  String formatTimeTo12Hour(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }
}
