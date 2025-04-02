import 'package:flutter/material.dart';

class CategoryTabModel {
  final int id;
  final String title;
  final IconData icon;

  const CategoryTabModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  static List<CategoryTabModel> tabs = [
    CategoryTabModel(id: 1, title: 'All', icon: Icons.explore),
    CategoryTabModel(id: 2, title: 'Sport', icon: Icons.sports_baseball),
    CategoryTabModel(id: 3, title: 'Birthday', icon: Icons.cake),
    CategoryTabModel(id: 4, title: 'Meeting', icon: Icons.meeting_room_rounded),
    CategoryTabModel(id: 5, title: 'Gaming', icon: Icons.gamepad_rounded),
    CategoryTabModel(id: 6, title: 'Eating', icon: Icons.fastfood_rounded),
    CategoryTabModel(
      id: 7,
      title: 'Holiday',
      icon: Icons.holiday_village_rounded,
    ),
    CategoryTabModel(id: 8, title: 'Exhibition', icon: Icons.event_available),
    CategoryTabModel(id: 9, title: 'Work Shop', icon: Icons.work_history),
    CategoryTabModel(id: 10, title: 'Book Club', icon: Icons.menu_book_rounded),
  ];
}
