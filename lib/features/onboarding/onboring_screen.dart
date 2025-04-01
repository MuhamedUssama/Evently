import 'package:evently/features/onboarding/model/onboarding_model.dart';
import 'package:evently/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:evently/features/onboarding/widgets/onboarding_body_widget.dart';
import 'package:evently/features/onboarding/widgets/onboarding_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoringScreen extends StatefulWidget {
  static const String routeName = '/onBoarding';
  const OnBoringScreen({super.key});

  @override
  State<OnBoringScreen> createState() => _OnBoringScreenState();
}

class _OnBoringScreenState extends State<OnBoringScreen> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    controller.addListener(() {
      currentPage = controller.page!.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 35.h),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {});
                },
                itemBuilder:
                    (context, index) => OnboardingBodyWidget(
                      model: OnboardingModel.getOnboarding[index],
                    ),
                itemCount: OnboardingModel.getOnboarding.length,
              ),
            ),
            SizedBox(height: 35.h),
            OnboardingBottomWidget(
              controller: controller,
              currentPage: currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
