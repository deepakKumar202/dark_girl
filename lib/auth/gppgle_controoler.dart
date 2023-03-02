import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_girl/view/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
class googleeController extends GetxController{
  final auth = FirebaseAuth.instance;
   loginWithGoogle() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    final googleSignin = GoogleSignIn();
    final googleUser = await googleSignin.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);
      checkUserAndRedirect(auth.currentUser!);
    } else {
      Get.back();
    }
  }
 checkUserAndRedirect(
    User user, {
    bool isGoogle = true,
  }) {
    final userRef = FirebaseFirestore.instance.collection('Users');
    userRef.doc(user.uid).get().then(
      (doc) async {
        if (doc.exists) {
          Get.offAll(() => const HomePage());
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('User not Registered'),
            ),
          );
          if (isGoogle) {
            await GoogleSignIn().signOut();
          }
          await auth.signOut();
          Get.back();
        }
      },
    );
  }
}