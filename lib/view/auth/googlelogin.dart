// ignore_for_file: unused_field, use_rethrow_when_possible, depend_on_referenced_packages

import 'package:cng_locator/view/auth/sign_up.dart';
import 'package:cng_locator/view/bottomnavigationbar/bottomnavigation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      

      Get.to(const HomePage()); // navigate to your wanted page
      return;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    Get.to(Sign_Up());
  }
}
