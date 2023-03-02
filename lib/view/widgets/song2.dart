import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Song2 extends StatefulWidget {
  const Song2({super.key});

  @override
  State<Song2> createState() => _Song2State();
}

class _Song2State extends State<Song2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song 2"),
      ),
    );
  }
}