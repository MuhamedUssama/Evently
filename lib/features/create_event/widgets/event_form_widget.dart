import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_validator.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EventFormWidget extends StatelessWidget {
  const EventFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Event Title',
              keyboardType: TextInputType.text,
              prefixIcon: SvgPicture.asset(AppSvgs.edit, fit: BoxFit.scaleDown),
              validator: (value) {
                return AppValidator.validateNotEmptyField(value);
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Description',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Event Description',
              keyboardType: TextInputType.text,
              maxLines: 6,
              validator: (value) {
                return AppValidator.validateNotEmptyField(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
