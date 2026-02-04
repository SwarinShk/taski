import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taski_app/constants/app_color.dart';
import 'package:taski_app/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool get isLoggedIn => _auth.currentUser != null;

  UserModel? userData;

  Future signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        userData = UserModel(name: name, email: email);
        var userDataAsJson = userData!.toJson();
        await _firestore.collection('allUsers').doc(email).set(userDataAsJson);

        Fluttertoast.showToast(
          msg: 'Account created successfully',
          textColor: AppColor.white,
          backgroundColor: AppColor.green,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? "Something went wrong",
        textColor: AppColor.white,
        backgroundColor: AppColor.fireRed,
      );
    }
  }

  Future signInUser({required String email, required String password}) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await fetchUserData();

        Fluttertoast.showToast(
          msg: 'Signed in successfully',
          textColor: AppColor.white,
          backgroundColor: AppColor.green,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? "Something went wrong",
        textColor: AppColor.white,
        backgroundColor: AppColor.fireRed,
      );
    }
  }

  Future fetchUserData() async {
    try {
      var userDataSnapshot = await _firestore
          .collection('allUsers')
          .doc(_auth.currentUser!.email)
          .get();
      if (userDataSnapshot.exists) {
        var userDataAsJson = userDataSnapshot.data() as Map<String, dynamic>;
        userData = UserModel.fromJson(userDataAsJson);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: AppColor.white,
        backgroundColor: AppColor.fireRed,
      );
    }
  }

  Future signOut() async {
    userData = null;
    await _auth.signOut();
    notifyListeners();
  }
}
