import 'package:evently/features/auth/forget_password/forget_password_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/onboarding/onboring_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Evently',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en'), Locale('ar')],
          locale: Locale('en'),
          routes: {
            OnBoringScreen.routeName: (_) => OnBoringScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            RegisterScreen.routeName: (_) => RegisterScreen(),
            ForgetPasswordScreen.routeName: (_) => ForgetPasswordScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
