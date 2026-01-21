import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.prefix,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.focusedBorderColor = AppColor.borderColor,
    this.maxLine = 1,
  });

  final TextEditingController? controller;
  final IconData? prefix;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color focusedBorderColor;
  final int? maxLine;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      validator: widget.validator,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        prefixIcon: widget.prefix != null ? Icon(widget.prefix) : null,
        prefixIconColor: AppColor.hintColor,
        filled: true,
        fillColor: AppColor.fillColor,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.hintColor,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(width: 1.2, color: widget.focusedBorderColor),
        suffixIcon: widget.obscureText ? _buildVisibilityIcon() : null,
      ),
    );
  }

  Widget _buildVisibilityIcon() {
    return IconButton(
      icon: Icon(
        _isObscured ? Amicons.vuesax_eye_slash : Amicons.vuesax_eye,
        color: AppColor.hintColor,
      ),
      onPressed: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
    );
  }

  OutlineInputBorder _border({
    double width = 1,
    Color color = AppColor.borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
