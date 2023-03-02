import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_girl/model/HomeMell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

class PostAll_Data extends StatefulWidget {
  const PostAll_Data({super.key});

  @override
  State<PostAll_Data> createState() => _PostAll_DataState();
}

class _PostAll_DataState extends State<PostAll_Data> {
  TextEditingController save = TextEditingController();
  File? image;

  selectImage() async {
    final list = await ImagesPicker.pick(
      count: 1,
    );
    if (list != null) {
      setState(() {
        image = File(list.first.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PostAll Data"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                        // borderRadius: BorderRadius.circular(20)),
                        height: 75,
                        width: 75,
                        child: image != null
                            ? Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox(),
                      ),
                      TextButton(
                          onPressed: selectImage, child: const Text("Select")),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: save,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Write a caption"),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 120),
              MaterialButton(
                color: Colors.blue,
                onPressed: uploadPost,
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadPost() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    final ref = FirebaseStorage.instance
        .ref("Images${DateTime.now().millisecondsSinceEpoch}");
    await ref.putFile(image!);
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection("Posts")
        .add(
          PostModel(
            id: "",
            title: save.text,
            description: "",
            images: [
              url,
            ],
            userName: FirebaseAuth.instance.currentUser!.displayName ??
                ("User${FirebaseAuth.instance.currentUser!.uid.substring(0, 4)}"),
            userImage:
                "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
            userId: FirebaseAuth.instance.currentUser!.uid,
            dateTime: DateTime.now().millisecondsSinceEpoch,
            videos: [],
          ).toJson(),
        )
        //delet photo id
        .then((value) async {
      await FirebaseFirestore.instance
          .collection("Posts")
          .doc(value.id)
          .update({
        "id": value.id,
      });
    });
    Get.back();
  }
}
