import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/onboarding/model/onboarding_model.dart';
import 'package:evently/features/onboarding/providers/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingBottomWidget extends StatelessWidget {
  const OnboardingBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: provider.currentPage != 0,
              child: IconButton.outlined(
                onPressed: () {
                  provider.previousPage();
                },
                style: IconButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
                highlightColor: Theme.of(
                  context,
                ).primaryColor.withValues(alpha: .3),
                icon: const Icon(Icons.arrow_back),
              ),
            ),

            DotsIndicator(
              dotsCount: OnboardingModel.getOnboarding.length,
              position: provider.currentPage.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            IconButton.outlined(
              onPressed: () {
                provider.nextPage();
                log('index: ${provider.currentPage}');
                if (provider.currentPage > 2) {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                }
              },
              style: IconButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
              highlightColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: .3),
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        );
      },
    );
  }
}
