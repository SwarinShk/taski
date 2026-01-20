import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/app_text_field.dart';
import 'package:taski_app/widgets/labeled_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign up',
          style: GoogleFonts.urbanist(
            color: AppColor.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(child: Image.asset('assets/app_logo.png', height: 120)),
              Text(
                'Welcome 👋',
                style: GoogleFonts.urbanist(
                  color: AppColor.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Please enter your details to continue',
                style: GoogleFonts.urbanist(
                  color: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25),
              LabeledField(
                label: 'Name',
                child: AppTextField(hintText: 'Please enter your name'),
              ),
              SizedBox(height: 15),
              LabeledField(
                label: 'Email',
                child: AppTextField(hintText: 'Plese enter your email'),
              ),
              SizedBox(height: 15),
              LabeledField(
                label: 'Password',
                child: AppTextField(
                  hintText: 'Please enter your password',
                  obscureText: true,
                ),
              ),
              SizedBox(height: 15),
              LabeledField(
                label: 'Confirm Password',
                child: AppTextField(
                  hintText: 'Confirm your password',
                  obscureText: true,
                ),
              ),
              SizedBox(height: 25),
              AppButton(
                height: 52,
                width: double.infinity,
                label: 'Sign Up',
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                    children: [
                      TextSpan(text: 'Already have an account?'),
                      TextSpan(text: '  '),
                      TextSpan(
                        text: 'Sign In',
                        style: GoogleFonts.urbanist(color: AppColor.themeColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
