import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: 15),
          RichText(
            text: TextSpan(
              style: GoogleFonts.urbanist(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
              children: [
                TextSpan(text: 'Welcome, '),
                TextSpan(
                  text: 'John',
                  style: GoogleFonts.urbanist(color: AppColor.themeColor),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Create tasks to achieve more.',
            style: GoogleFonts.urbanist(
              color: AppColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  Image.asset('assets/images/clipboard.png'),
                  SizedBox(height: 24),
                  Text(
                    'You have no task listed.',
                    style: GoogleFonts.urbanist(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 28),
                  AppButton(
                    icon: Amicons.vuesax_add,
                    label: 'Create task',
                    backgroundColor: AppColor.themeColor.withValues(alpha: 0.1),
                    itemColor: AppColor.themeColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
