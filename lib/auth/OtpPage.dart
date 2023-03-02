import 'package:dark_girl/auth/make_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPpagee extends StatefulWidget {
  const OTPpagee({super.key});

  @override
  State<OTPpagee> createState() => _OTPpageeState();
}

class _OTPpageeState extends State<OTPpagee> {
  TextEditingController number = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "OTP",
                  style: TextStyle(fontSize: 45),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: number,
                  decoration: const InputDecoration(
                      hintText: "OTP", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    child: const Text("Otp Sent"),
                    onPressed: () {
                      Get.to(const MakePassword());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
