import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/onboarding/onboring_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {OnBoringScreen.routeName: (_) => OnBoringScreen()},
      initialRoute: OnBoringScreen.routeName,
    );
  }
}
