import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/category_tab_model.dart';

class Event {
  static const String collectionName = 'events';

  String id;
  CategoryTabModel category;
  String title;
  String userId;
  String description;
  DateTime dateTime;
  double lat;
  double long;
  String city;
  String country;

  Event({
    this.id = '',
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.userId,
    this.lat = 0.0,
    this.long = 0.0,
    this.city = 'Unknown',
    this.country = 'Unknown',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryId': category.id,
    'title': title,
    'description': description,
    'dateTime': Timestamp.fromDate(dateTime),
    'userId': userId,
    'lat': lat,
    'long': long,
    'city': city,
    'country': country,
  };

  Event.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: CategoryTabModel.tabs.firstWhere(
          (category) => category.id == json['categoryId'],
        ),
        dateTime: (json['dateTime'] as Timestamp).toDate(),
        userId: json['userId'],
        lat: json['lat'] ?? 37.42796133580664,
        long: json['long'] ?? -122.085749655962,
        city: json['city'] ?? 'Unknown',
        country: json['country'] ?? 'Unknown',
      );
}
