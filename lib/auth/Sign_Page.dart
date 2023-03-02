import 'package:dark_girl/auth/Forget_Password.dart';
import 'package:dark_girl/auth/SignUp_Page.dart';
import 'package:dark_girl/auth/gppgle_controoler.dart';
import 'package:dark_girl/bottomBarr/BottomBarPages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final data = Get.put(googleeController());
  final passController = TextEditingController();
  final emalController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    }),
                    controller: emalController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    }),
                    controller: passController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 55),
                  TextButton(
                      onPressed: () {
                        Get.to(const SignupPage());
                      },
                      child: const Text(
                        "Creat New Account",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )),
                  TextButton(
                      onPressed: () {
                        Get.to(const Forget_Password());
                      },
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      )),
                  MaterialButton(
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: Get.width * 0.7,
                      color: Colors.red,
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          _auth.createUserWithEmailAndPassword(
                              email: emalController.text,
                              password: passController.text);
                          Get.to(const BottomPages());
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(height: 20),
                  MaterialButton(
                      color: Colors.red,
                      child: const Text("Google"),
                      onPressed: () {
                        data.loginWithGoogle();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
