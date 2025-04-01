import 'package:dots_indicator/dots_indicator.dart';
import 'package:evently/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingBottomWidget extends StatelessWidget {
  final PageController controller;
  final int currentPage;

  const OnboardingBottomWidget({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: currentPage != 0,
          child: IconButton.outlined(
            onPressed: () {
              controller.animateToPage(
                (currentPage - 1),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
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
          position: currentPage.toDouble(),
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
            controller.animateToPage(
              (currentPage + 1),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          style: IconButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          highlightColor: Theme.of(context).primaryColor.withValues(alpha: .3),
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
