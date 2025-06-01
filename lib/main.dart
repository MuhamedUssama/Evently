import 'package:evently/core/cache/shared_preferences.dart';
import 'package:evently/core/providers/settings_provider.dart';
import 'package:evently/evently_app.dart';
import 'package:evently/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const EventlyApp(),
    ),
  );
}
