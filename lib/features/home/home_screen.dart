import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/home/widgets/add_event_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddEventIconWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
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
          currentIndex: 1,
          enableFeedback: false,
          onTap: (value) {},
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
