import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';

class EmptyState extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget? child;

  const EmptyState({
    super.key,
    this.imagePath = 'assets/images/clipboard.png',
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, fit: BoxFit.contain),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.urbanist(
              color: AppColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (child != null) ...[const SizedBox(height: 24), child!],
        ],
      ),
    );
  }
}
