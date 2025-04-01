import 'package:evently/features/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBodyWidget extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingBodyWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 28.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          model.imagePath,
          height: 360.h,
          width: 360.w,
          fit: BoxFit.cover,
        ),
        Text(model.title, style: Theme.of(context).textTheme.titleLarge),
        Text(model.description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
