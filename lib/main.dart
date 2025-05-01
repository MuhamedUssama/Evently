import 'package:evently/features/auth/forget_password/forget_password_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:evently/features/create_event/create_event_screen.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/onboarding/onboring_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
            OnBoringScreen.routeName: (_) => const OnBoringScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            RegisterScreen.routeName: (_) => const RegisterScreen(),
            ForgetPasswordScreen.routeName: (_) => const ForgetPasswordScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            CreateEventScreen.routeName: (_) => const CreateEventScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
