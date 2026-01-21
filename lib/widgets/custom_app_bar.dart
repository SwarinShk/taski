import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';

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
