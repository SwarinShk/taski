import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taski_app/constants/storage_constants.dart';
import 'package:taski_app/screens/dashboard_page.dart';
import 'package:taski_app/screens/login_page.dart';
import 'package:taski_app/screens/onboarding_page.dart';
import 'package:taski_app/provider/auth_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() async {
    final pref = await SharedPreferences.getInstance();
    bool isFirstTime = pref.getBool(StorageConstants.firstTime) ?? true;

    if (!mounted) return;
    var isLoggedIn = context.read<AuthProvider>().isLoggedIn;

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
      return;
    } else if (isLoggedIn) {
      context.read<AuthProvider>().fetchUserData();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
      return;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
      return;
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/app_logo.png', height: 170)),
    );
  }
}
