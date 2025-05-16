import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/widgets/event_card_widget.dart';
import 'package:evently/features/tabs/love_tab/provider/love_tab_provider.dart';
import 'package:evently/features/tabs/love_tab/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoveTabProvider(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          child: Column(
            children: [
              CustomSearchTextField(controller: TextEditingController()),
              Consumer<LoveTabProvider>(
                builder: (context, provider, child) {
                  return Expanded(
                    child: RefreshIndicator(
                      color: AppTheme.primary,
                      onRefresh: () => provider.getFavoriteEvents(),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        itemBuilder: (context, index) {
                          return EventCardWidget(
                            event: provider.favoriteEvents[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16.h);
                        },
                        itemCount: provider.favoriteEvents.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
