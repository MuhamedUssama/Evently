import 'package:evently/features/home/provider/home_screen_provider.dart';
import 'package:evently/features/home/widgets/add_event_icon_widget.dart';
import 'package:evently/features/home/widgets/home_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Scaffold(
        body: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) {
            return IndexedStack(
              index: provider.currentIndex,
              children: provider.tabs,
            );
          },
        ),
        floatingActionButton: AddEventIconWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: HomeBottomNavigationBar(),
      ),
    );
  }
}
