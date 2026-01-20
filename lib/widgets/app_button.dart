import 'package:flutter/material.dart';
import 'package:taski_app/constants/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.icon,
    required this.label,
    this.backgroundColor = AppColor.buttonBackground,
    this.itemColor = AppColor.white,
    this.onPressed,
  });

  final double? height;
  final double? width;
  final IconData? icon;
  final String label;
  final Color backgroundColor;
  final Color itemColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        icon: icon != null
            ? Icon(icon, color: itemColor, fontWeight: FontWeight.w600)
            : null,
        label: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: itemColor,
          ),
        ),
      ),
    );
  }
}
