import 'package:dark_girl/auth/OtpPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_screen/otp_screen.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  TextEditingController number = TextEditingController();
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
                  "Forget Password",
                  style: TextStyle(fontSize: 45),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: number,
                  decoration: const InputDecoration(
                      hintText: "Number", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    child: const Text("Otp Sent"),
                    onPressed: () {
                      Get.to(const OTPpagee());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
