import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AddEventIconWidget extends StatelessWidget {
  const AddEventIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.backgroundLight,
        shape: CircleBorder(
          side: BorderSide(color: AppTheme.backgroundLight, width: 5),
        ),
      ),
      icon: Icon(Icons.add_rounded, size: 36),
    );
  }
}
