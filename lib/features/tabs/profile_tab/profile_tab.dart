import 'package:evently/core/providers/settings_provider.dart';
import 'package:evently/core/services/firebase_services.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/tabs/profile_tab/widgets/profile_tab_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        ProfileTabHeader(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color:
                          settingsProvider.isDarkMode
                              ? AppTheme.whiteDark
                              : AppTheme.black,
                    ),
                  ),
                  Switch(
                    value: settingsProvider.isDarkMode,
                    activeColor: AppTheme.primary,
                    inactiveTrackColor: AppTheme.backgroundLight,
                    activeTrackColor: AppTheme.primary.withValues(alpha: .5),
                    inactiveThumbColor: AppTheme.grey,
                    onChanged: (value) {
                      settingsProvider.changeTheme(
                        value ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  ),
                ],
              ),
              Text(
                'Language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color:
                      settingsProvider.isDarkMode
                          ? AppTheme.whiteDark
                          : AppTheme.black,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primary),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: DropdownButton(
                  items:
                      settingsProvider.languages
                          .map(
                            (language) => DropdownMenuItem(
                              value: language.code,
                              child: Text(
                                language.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          )
                          .toList(),
                  value: settingsProvider.languageCode,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(16.r),
                  focusColor: AppTheme.primary,
                  itemHeight: 56.h,
                  underline: SizedBox.shrink(),
                  dropdownColor: AppTheme.backgroundLight,
                  onChanged: (value) {
                    settingsProvider.changeLanguage(value!);
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await FirebaseServices.logout();
                  Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    LoginScreen.routeName,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.red,
                  foregroundColor: AppTheme.white,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.logout_outlined),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
