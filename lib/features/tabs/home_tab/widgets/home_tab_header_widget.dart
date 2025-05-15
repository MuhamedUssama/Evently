import 'package:evently/core/models/category_tab_model.dart';
import 'package:evently/core/providers/user_provider.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/features/tabs/home_tab/widgets/tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeTabHeaderWidget extends StatelessWidget {
  final HomeTabProvider provider;
  const HomeTabHeaderWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                spacing: 8.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back ✨',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            Provider.of<UserProvider>(
                                  context,
                                ).currentUser?.name ??
                                'User',

                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AppIcons.sun),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8.w,
                    children: [
                      SvgPicture.asset(AppIcons.maps),
                      Text(
                        '${provider.city ?? 'Unknown'}, ${provider.country ?? 'Unknown'}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Consumer<HomeTabProvider>(
              builder: (context, provider, child) {
                return TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  tabAlignment: TabAlignment.start,
                  onTap: (index) {
                    provider.changeSelectedTab(index);
                  },
                  tabs:
                      CategoryTabModel.tabs
                          .map(
                            (tab) => TabBarItemWidget(
                              tabModel: tab,
                              isSelected:
                                  provider.currentIndex ==
                                  CategoryTabModel.tabs.indexOf(tab),
                            ),
                          )
                          .toList(),
                );
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
