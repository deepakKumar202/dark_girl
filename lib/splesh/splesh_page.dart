import 'package:dark_girl/auth/Sign_Page.dart';
import 'package:dark_girl/view/Songdesign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class splesh extends StatefulWidget {
  @override
  _spleshState createState() => _spleshState();
}

class _spleshState extends State<splesh> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: FirebaseAuth.instance.currentUser != null
          ? const SongDesign()
          : const SignInPage(),
      title: const Text(
        'Welcome In SplashScreen',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
