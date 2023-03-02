import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MakePassword extends StatefulWidget {
  const MakePassword({super.key});

  @override
  State<MakePassword> createState() => _MakePasswordState();
}

class _MakePasswordState extends State<MakePassword> {
  TextEditingController pass = TextEditingController();
  TextEditingController conf = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                  const SizedBox(height: 120),
                  MaterialButton(
                      color: Colors.red,
                      child: const Text("Submit"),
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
