import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_girl/view/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupCOntroller extends GetxController {
  final _auth = FirebaseAuth.instance;
  final auth = FirebaseAuth.instance;

  creatCount(String name, String email, String pass, String confPassw) async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      final data = await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: email)
          .get();
      if (data.docs.isEmpty) {
        try {
          final user = await _auth.createUserWithEmailAndPassword(
              email: email, password: pass);
          if (user.user != null) {
            saveUser(name: name);
          }
        } on FirebaseAuthException catch (e) {
          Get.back();
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
            ),
          );
        }
      } else {
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text('User already exists'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
    }
  }

  saveUser({
    required String name,
    // String? photo,
    String? email,
  }) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'email': email ?? auth.currentUser!.email,
      'name': name,
      // 'photo': photo ?? auth.currentUser!.photoURL,
    });
    Get.offAll(() => const HomePage());
  }
}
