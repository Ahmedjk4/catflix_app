import 'package:catflix/themes/themes.dart';
import 'package:catflix/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('index');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppThemes().darkTheme(),
      theme: AppThemes().lightTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Catflix',
      home: const SplashScreen(),
    );
  }
}
