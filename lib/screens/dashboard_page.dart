import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/screens/done_page.dart';
import 'package:taski_app/screens/home_page.dart';
import 'package:taski_app/screens/search_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  List screens = [HomePage(), HomePage(), SearchPage(), DonePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() => currentIndex = val);

          if (currentIndex == 1) {
            showModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                width: double.infinity,
                child: Column(children: [Text('data')]),
              ),
            );
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
