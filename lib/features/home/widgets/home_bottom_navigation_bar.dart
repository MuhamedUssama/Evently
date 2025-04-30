import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/home/provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: AppTheme.primary,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: CircularNotchedRectangle(),
      child: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomNavigationBar(
          elevation: 0,
          enableFeedback: false,
          currentIndex: context.watch<HomeScreenProvider>().currentIndex,
          onTap: (index) {
            context.read<HomeScreenProvider>().chageTab(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.home),
              activeIcon: SvgPicture.asset(AppIcons.homeActive),
              label: 'Home',
              backgroundColor: AppTheme.primary,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.maps),
              activeIcon: SvgPicture.asset(AppIcons.mapsActive),
              label: 'Map',
              backgroundColor: AppTheme.primary,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.love),
              activeIcon: SvgPicture.asset(AppIcons.loveActive),
              label: 'Love',
              backgroundColor: AppTheme.primary,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppIcons.profile),
              activeIcon: SvgPicture.asset(AppIcons.profileActive),
              label: 'Profile',
              backgroundColor: AppTheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
