import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Icon(
              Amicons.vuesax_tick_square_fill,
              size: 28,
              color: AppColor.themeColor,
            ),
            SizedBox(width: 8),
            Text(
              'Taski',
              style: GoogleFonts.urbanist(
                color: AppColor.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Text(
            'John',
            style: GoogleFonts.urbanist(
              color: AppColor.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_image.png'),
              radius: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
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
                        backgroundColor: AppColor.themeColor.withValues(
                          alpha: 0.1,
                        ),
                        itemColor: AppColor.themeColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Amicons.vuesax_task_square),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Amicons.vuesax_add_square),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Amicons.vuesax_search_normal),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Amicons.vuesax_tick_square),
            label: 'Done',
          ),
        ],
        selectedItemColor: AppColor.themeColor,
        unselectedItemColor: AppColor.hintColor,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
      ),
    );
  }
}
