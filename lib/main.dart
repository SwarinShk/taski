import 'package:flutter/material.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/screens/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taski',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.themeColor),
      ),
      home: SplashPage(),
    );
  }
}
