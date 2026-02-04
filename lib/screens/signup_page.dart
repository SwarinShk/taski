import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/provider/auth_provider.dart';
import 'package:taski_app/provider/validation_provider.dart';
import 'package:taski_app/screens/dashboard_page.dart';
import 'package:taski_app/widgets/app_button.dart';
import 'package:taski_app/widgets/app_text_field.dart';
import 'package:taski_app/widgets/labeled_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();

    await authProvider.signUpUser(
      name: _nameController.text,
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardPage()),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validationProvider = context.read<ValidationProvider>();

    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset('assets/app_logo.png', height: 120),
                    ),
                    Text(
                      'Welcome 👋',
                      style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Please enter your details to continue',
                      style: GoogleFonts.urbanist(fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    LabeledField(
                      label: 'Name',
                      child: AppTextField(
                        hintText: 'Please enter your name',
                        controller: _nameController,
                        validator: validationProvider.validateName,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LabeledField(
                      label: 'Email',
                      child: AppTextField(
                        hintText: 'Please enter your email',
                        controller: _emailController,
                        validator: validationProvider.validateEmail,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LabeledField(
                      label: 'Password',
                      child: AppTextField(
                        hintText: 'Please enter your password',
                        obscureText: true,
                        controller: _passwordController,
                        validator: validationProvider.validatePassword,
                      ),
                    ),
                    const SizedBox(height: 15),
                    LabeledField(
                      label: 'Confirm Password',
                      child: AppTextField(
                        hintText: 'Confirm your password',
                        obscureText: true,
                        controller: _confirmPasswordController,
                        validator: (_) =>
                            validationProvider.validateConfirmPassword(
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                            ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    AppButton(
                      height: 52,
                      width: double.infinity,
                      label: 'Sign Up',
                      onPressed: _signUp,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: AppColor.black,
                          ),
                          children: [
                            const TextSpan(text: 'Already have an account?'),
                            const TextSpan(text: '  '),
                            TextSpan(
                              text: 'Sign In',
                              style: GoogleFonts.urbanist(
                                color: AppColor.themeColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
