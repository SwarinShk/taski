import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 15),
          SearchBar(
            elevation: const WidgetStatePropertyAll(0),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            hintText: 'Search city',
            hintStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.hintColor,
              ),
            ),
            leading: Icon(Amicons.vuesax_search_normal),
            trailing: [const Icon(Icons.search)],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  Image.asset('assets/images/clipboard.png'),
                  SizedBox(height: 24),
                  Text(
                    'No result found.',
                    style: GoogleFonts.urbanist(
                      color: AppColor.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
