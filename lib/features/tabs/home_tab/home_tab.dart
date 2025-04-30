import 'package:evently/features/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:evently/core/widgets/event_card_widget.dart';
import 'package:evently/features/tabs/home_tab/widgets/home_tab_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeTabProvider(),
      child: DefaultTabController(
        length: 10,
        child: Column(
          children: [
            HomeTabHeaderWidget(),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) => EventCardWidget(),
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
