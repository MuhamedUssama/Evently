import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:evently/features/create_event/provider/create_event_screen_provider.dart';
import 'package:evently/features/create_event/widgets/category_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatelessWidget {
  static const String routeName = '/createEvent';
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventScreenProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Event'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_rounded, color: AppTheme.primary),
          ),
        ),
        body: Consumer<CreateEventScreenProvider>(
          builder: (context, provider, child) {
            return Column(
              spacing: 16,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: LocalCachedImage(
                      height: 200.h,
                      width: double.infinity,
                      imagePath:
                          CategoryTabModel
                              .tabs[provider.currentIndex]
                              .lightImagePath ??
                          '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 46.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return CategoryTabItem(
                        tabModel:
                            CategoryTabModel.tabs[index + provider.startIndex],
                        isSelected:
                            provider.currentIndex ==
                            index + provider.startIndex,
                        onTap: () {
                          provider.onCategoryClicked(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 10.w),
                    itemCount:
                        CategoryTabModel.tabs.length - provider.startIndex,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
