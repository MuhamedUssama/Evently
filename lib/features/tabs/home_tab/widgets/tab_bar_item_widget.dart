import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarItemWidget extends StatelessWidget {
  final CategoryTabModel tabModel;
  final bool isSelected;

  const TabBarItemWidget({
    super.key,
    required this.tabModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.backgroundLight : AppTheme.primary,
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(color: AppTheme.backgroundLight),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Icon(
            tabModel.icon,
            color: isSelected ? AppTheme.primary : AppTheme.backgroundLight,
          ),
          Text(
            tabModel.title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isSelected ? AppTheme.primary : AppTheme.backgroundLight,
            ),
          ),
        ],
      ),
    );
  }
}
