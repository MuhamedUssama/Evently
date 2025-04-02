import 'package:evently/features/onboarding/model/onboarding_model.dart';
import 'package:evently/features/onboarding/providers/onboarding_provider.dart';
import 'package:evently/features/onboarding/widgets/onboarding_app_bar.dart';
import 'package:evently/features/onboarding/widgets/onboarding_body_widget.dart';
import 'package:evently/features/onboarding/widgets/onboarding_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnBoringScreen extends StatelessWidget {
  static const String routeName = '/onBoarding';
  const OnBoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: Scaffold(
        appBar: OnboardingAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Expanded(
                child: Consumer<OnboardingProvider>(
                  builder: (context, provider, child) {
                    return PageView.builder(
                      controller: provider.pageController,
                      onPageChanged: (index) => provider.setCurrentIndex(index),
                      itemBuilder:
                          (context, index) => OnboardingBodyWidget(
                            model: OnboardingModel.getOnboarding[index],
                          ),
                      itemCount: OnboardingModel.getOnboarding.length,
                    );
                  },
                ),
              ),
              SizedBox(height: 35.h),
              OnboardingBottomWidget(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
