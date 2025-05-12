import 'package:evently/core/models/user_model.dart';
import 'package:evently/core/providers/user_provider.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTabHeader extends StatelessWidget {
  const ProfileTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Provider.of<UserProvider>(context).currentUser;
    return Container(
      width: double.infinity,
      height: 220.h,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64.r)),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Container(
              width: 124.w,
              height: 124.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1000),
                  bottomRight: Radius.circular(1000),
                  topRight: Radius.circular(1000),
                ),
                image: DecorationImage(
                  image: AssetImage(AppImages.route),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user?.name ?? 'User',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    user?.email ?? 'email',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
