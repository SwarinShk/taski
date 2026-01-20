import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/constants/storage_constants.dart';
import 'package:taski_app/screens/login_page.dart';
import 'package:taski_app/widgets/app_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          children: [
            Center(
              child: Image.asset('assets/images/onboarding.png', height: 250),
            ),
            Text(
              'Welcome to taski app',
              style: GoogleFonts.urbanist(
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppButton(
              label: 'Get Started',
              itemColor: AppColor.themeColor,
              backgroundColor: AppColor.white,
              elevation: 2,
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setBool(StorageConstants.firstTime, false);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
