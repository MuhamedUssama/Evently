import 'package:evently/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CategoryTabModel {
  final int id;
  final String title;
  final IconData icon;
  final String? lightImagePath;

  const CategoryTabModel({
    required this.id,
    required this.title,
    required this.icon,
    this.lightImagePath,
  });

  static List<CategoryTabModel> tabs = [
    CategoryTabModel(id: 1, title: 'All', icon: Icons.explore),
    CategoryTabModel(
      id: 2,
      title: 'Sport',
      icon: Icons.sports_baseball,
      lightImagePath: AppImages.sportsCategoryLight,
    ),
    CategoryTabModel(
      id: 3,
      title: 'Birthday',
      icon: Icons.cake,
      lightImagePath: AppImages.birthdayCategoryLight,
    ),
    CategoryTabModel(
      id: 4,
      title: 'Meeting',
      icon: Icons.meeting_room_rounded,
      lightImagePath: AppImages.meetingCategoryLight,
    ),
    CategoryTabModel(
      id: 5,
      title: 'Gaming',
      icon: Icons.gamepad_rounded,
      lightImagePath: AppImages.gamingCategoryLight,
    ),
    CategoryTabModel(
      id: 6,
      title: 'Eating',
      icon: Icons.fastfood_rounded,
      lightImagePath: AppImages.eatingCategoryLight,
    ),
    CategoryTabModel(
      id: 7,
      title: 'Holiday',
      icon: Icons.holiday_village_rounded,
      lightImagePath: AppImages.holidayCategoryLight,
    ),
    CategoryTabModel(
      id: 8,
      title: 'Exhibition',
      icon: Icons.event_available,
      lightImagePath: AppImages.exhibitionCategoryLight,
    ),
    CategoryTabModel(
      id: 9,
      title: 'Work Shop',
      icon: Icons.work_history,
      lightImagePath: AppImages.workshopCategoryLight,
    ),
    CategoryTabModel(
      id: 10,
      title: 'Book Club',
      icon: Icons.menu_book_rounded,
      lightImagePath: AppImages.bookClubCategoryLight,
    ),
  ];
}
