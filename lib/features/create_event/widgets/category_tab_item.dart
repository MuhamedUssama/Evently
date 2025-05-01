import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabItem extends StatelessWidget {
  final CategoryTabModel tabModel;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTabItem({
    super.key,
    required this.tabModel,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : AppTheme.backgroundLight,
          borderRadius: BorderRadius.circular(46.r),
          border: Border.all(color: AppTheme.primary),
        ),
        child: Row(
          spacing: 8.w,
          children: [
            Icon(
              tabModel.icon,
              color: isSelected ? AppTheme.backgroundLight : AppTheme.primary,
            ),
            Text(
              tabModel.title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSelected ? AppTheme.backgroundLight : AppTheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
