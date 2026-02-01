import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski_app/constants/app_color.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> signUpUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Fluttertoast.showToast(
        msg: 'Account created successfully',
        textColor: AppColor.white,
        backgroundColor: AppColor.green,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';

      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already registered. Please log in.';
          break;
        case 'weak-password':
          message = 'Password is too weak.';
          break;
        case 'invalid-email':
          message = 'Invalid email address.';
          break;
      }

      Fluttertoast.showToast(
        msg: message,
        textColor: AppColor.white,
        backgroundColor: AppColor.fireRed,
      );

      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signInUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Fluttertoast.showToast(
        msg: 'Signed in successfully',
        textColor: AppColor.white,
        backgroundColor: AppColor.green,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';

      switch (e.code) {
        case 'user-not-found':
          message = 'No account found with this email';
          break;
        case 'wrong-password':
          message = 'Incorrect password';
          break;
        case 'invalid-email':
          message = 'Invalid email address';
          break;
        case 'invalid-credential':
          message = 'Email or password is incorrect';
          break;
        case 'user-disabled':
          message = 'This account has been disabled';
          break;
      }

      Fluttertoast.showToast(
        msg: message,
        textColor: AppColor.white,
        backgroundColor: AppColor.fireRed,
      );

      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
