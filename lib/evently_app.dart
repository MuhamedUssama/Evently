import 'package:evently/core/cache/shared_preferences.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/providers/settings_provider.dart';
import 'package:evently/core/providers/user_provider.dart';
import 'package:evently/features/auth/forget_password/forget_password_screen.dart';
import 'package:evently/features/auth/register/register_screen.dart';
import 'package:evently/features/create_event/create_event_screen.dart';
import 'package:evently/features/create_event/pick_location_screen.dart';
import 'package:evently/features/create_event/provider/create_event_screen_provider.dart';
import 'package:evently/features/event_details/event_details_screen.dart';
import 'package:evently/features/event_details/provider/event_details_provider.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/tabs/maps_tab/provider/maps_tab_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/login/login_screen.dart';
import 'package:evently/features/onboarding/onboring_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of<SettingsProvider>(context);
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
          themeMode: provider.themeMode,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en'), Locale('ar')],
          locale: Locale(provider.languageCode),
          routes: {
            OnBoringScreen.routeName: (_) => const OnBoringScreen(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            RegisterScreen.routeName: (_) => const RegisterScreen(),
            ForgetPasswordScreen.routeName: (_) => const ForgetPasswordScreen(),
            EventDetailsScreen.routeName: (context) {
              Event event = ModalRoute.of(context)?.settings.arguments as Event;

              return ChangeNotifierProvider(
                create: (context) => EventDetailsProvider(),
                child: EventDetailsScreen(event: event),
              );
            },
            HomeScreen.routeName:
                (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (context) => UserProvider()),
                    ChangeNotifierProvider(
                      create: (context) => MapsTabProvider(),
                    ),
                  ],
                  child: const HomeScreen(),
                ),
            CreateEventScreen.routeName: (context) {
              Event? event =
                  ModalRoute.of(context)?.settings.arguments as Event?;

              return CreateEventScreen(event: event);
            },
            PickLocationScreen.routeName: (context) {
              CreateEventScreenProvider provider =
                  ModalRoute.of(context)?.settings.arguments
                      as CreateEventScreenProvider;

              return PickLocationScreen(provider: provider);
            },
          },
          initialRoute: _getInitialRoute(),
        );
      },
    );
  }

  String _getInitialRoute() {
    if (SharedPreferencesHelper.getBool(key: 'onBoarding')) {
      final user = FirebaseAuth.instance.currentUser;
      return user != null ? HomeScreen.routeName : LoginScreen.routeName;
    } else {
      return OnBoringScreen.routeName;
    }
  }
}
