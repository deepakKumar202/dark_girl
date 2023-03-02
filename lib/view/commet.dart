import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentUser extends StatefulWidget {
  const CommentUser({super.key});

  @override
  State<CommentUser> createState() => _CommentUserState();
}

class _CommentUserState extends State<CommentUser> {
  bool cheak = true;
  final _auth = FirebaseAuth.instance;
  TextEditingController conment = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage("post.userImage"),
                    ),
                    title: const Text(
                      "post.userName",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 13,
                            backgroundImage: AssetImage('images/3.png'),
                          ),
                          const SizedBox(width: 5),
                          const CircleAvatar(
                            radius: 13,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            height: 20,
                            width: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "post.title",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    trailing: Container(
                      height: 35,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromARGB(255, 177, 10, 85))),
                      child: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 177, 10, 85),
                      ),
                    ),
                  ),
                  const Text("08 jul, 08:8:07 AM"),
                  const SizedBox(height: 30),
                  const Text("# Tremnding"),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/5.png'),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIcon(
                        "0",
                        Icons.favorite,
                        Colors.red,
                      ),
                      10.heightBox,
                      buildIcon(
                        "0",
                        Icons.favorite,
                        Colors.red,
                      ),
                      10.heightBox,
                      InkWell(
                        onTap: () {
                          Get.to(const CommentUser());
                        },
                        child: buildIcon(
                          "1",
                          Icons.comment,
                          Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 156, 94, 150),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Comments",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const CircleAvatar(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "Deepak Kumar",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "  1d",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "hsdfbjhsd",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.thumb_up),
                                          SizedBox(width: 20),
                                          Icon(Icons.comment),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Comment"),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget buildIcon(String text, IconData image, Color colorr) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Icon(
            image,
            color: colorr,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          ),
        ]));
  }
}
