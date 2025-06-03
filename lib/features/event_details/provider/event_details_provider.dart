import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailsProvider extends ChangeNotifier {
  String formatEventDate(DateTime date) {
    DateFormat formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(date);
  }

  String formatEventTime(DateTime date) {
    DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(date);
  }
}
