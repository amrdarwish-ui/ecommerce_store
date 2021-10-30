import 'package:ecommerce_store/constants.dart';
import 'package:ecommerce_store/view/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends GetxController {
  String? email, password, name;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(firebaseAuth.authStateChanges());
    checkUser();

    super.onInit();
  }

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("email")?.toString();
  }

  void createUser() async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email!.toString(), password: password!.toString());
      print(result);
    } catch (e) {
      Get.snackbar('Erorr', '$e',
          backgroundColor: primaryGreen,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(20));
    }
  }

  void signIn() async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email!.toString(), password: password!.toString());
      if (result != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("email", email.toString());
        Get.offAll(HomeView());
      }
      print(result);
    } catch (e) {
      Get.snackbar('Erorr', '$e',
          backgroundColor: primaryGreen,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(20));
    }
  }

  void SignInWithGoogle() async {
    googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          await firebaseAuth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("email", result.user!.email.toString());
        Get.offAll(HomeView());
      }
    }
  }

  void signOut() async {
    try {
      var result = await firebaseAuth.signOut();
    } catch (e) {
      Get.snackbar('Erorr', '$e',
          backgroundColor: primaryGreen,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          animationDuration: Duration(milliseconds: 500),
          margin: EdgeInsets.all(20));
    }
  }
}
