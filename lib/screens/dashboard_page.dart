import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/screens/done_page.dart';
import 'package:taski_app/screens/home_page.dart';
import 'package:taski_app/screens/search_page.dart';
import 'package:taski_app/widgets/custom_app_bar.dart';
import 'package:taski_app/widgets/task_bottom_sheet.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  final List screens = const [HomePage(), HomePage(), SearchPage(), DonePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);

          if (index == 1) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => TaskBottomSheet(),
            );
            return;
          }
        },

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
