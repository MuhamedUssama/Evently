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
            spacing: 16,
            children: [
              CustomSearchTextField(controller: TextEditingController()),
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: (context, index) => EventCardWidget(),
              //     separatorBuilder: (context, index) => SizedBox(height: 16.h),
              //     itemCount: 5,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
