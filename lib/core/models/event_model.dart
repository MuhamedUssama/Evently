import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/category_tab_model.dart';

class Event {
  static const String collectionName = 'events';

  String id;
  CategoryTabModel category;
  String title;
  String description;
  DateTime dateTime;

  Event({
    this.id = '',
    required this.category,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryId': category.id,
    'title': title,
    'description': description,
    'dateTime': Timestamp.fromDate(dateTime),
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
      );
}
