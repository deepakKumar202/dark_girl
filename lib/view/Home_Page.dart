import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_girl/auth/Sign_Page.dart';
import 'package:dark_girl/model/HomeMell.dart';
import 'package:dark_girl/view/Post_All_Dataa.dart';
import 'package:dark_girl/view/commet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool cheak = true;
  final _auth = FirebaseAuth.instance;

  like(String id) async {
    await FirebaseFirestore.instance
        .collection("Posts")
        .doc(id)
        .collection("Likes")
        .add(
          Likes(
            userId: FirebaseAuth.instance.currentUser!.uid,
            userName: "",
            userImage: "",
            dateTime: DateTime.now().millisecondsSinceEpoch,
          ).toJson(),
        );
  }

  unlike(String id) async {
    await FirebaseFirestore.instance
        .collection("Posts")
        .doc(id)
        .collection("Likes")
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) async {
        await FirebaseFirestore.instance
            .collection("Posts")
            .doc(id)
            .collection("Likes")
            .doc(value.docs.first.id)
            .delete();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 231, 123, 116),
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(const PostAll_Data());
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Moment"),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Get.to(const SignInPage());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection("Posts").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData == false) {
              return const SizedBox();
            }
            List<PostModel> posts = List<PostModel>.from(
                snapshot.data!.docs.map((e) => PostModel.fromJson(e.data())));
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: ((context, index) {
                final post = posts[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(post.userImage),
                            ),
                            title: Text(
                              post.userName,
                              style: const TextStyle(
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
                                    backgroundImage: AssetImage('images/2.png'),
                                  ),
                                  const SizedBox(width: 5),
                                  const CircleAvatar(
                                    radius: 13,
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 20,
                                    width: 60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          post.title,
                                          style: const TextStyle(
                                              color: Colors.white),
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
                                      color: const Color.fromARGB(
                                          255, 177, 10, 85))),
                              child: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 177, 10, 85),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      post.title,
                                    ),
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: Get.height * 0.7,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(post.images.first),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        PopupMenuButton<int>(
                                          color: Colors.white,
                                          itemBuilder: (context) => [
                                            const PopupMenuItem(
                                              value: 1,
                                              // row with 2 children
                                              child: Text("Deleat"),
                                            ),
                                            const PopupMenuItem(
                                              value: 2,
                                              // row with 2 children
                                              child: Text("Follow"),
                                            ),
                                          ],
                                          onSelected: (value) async {
                                            if (value == 1) {
                                              if (post.userId ==
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid) {
                                                await FirebaseFirestore.instance
                                                    .collection("Posts")
                                                    .doc(post.id)
                                                    .delete();
                                              }
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StreamBuilder<
                                        QuerySnapshot<Map<String, dynamic>>>(
                                      stream: FirebaseFirestore.instance
                                          .collection("Posts")
                                          .doc(post.id)
                                          .collection("Likes")
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData == false) {
                                          return const SizedBox();
                                        }

                                        final isliked = snapshot.data!.docs.any(
                                            (element) =>
                                                element.data()['userId'] ==
                                                FirebaseAuth
                                                    .instance.currentUser!.uid);
                                        return buildIcon(
                                          snapshot.data!.docs.length.toString(),
                                          isliked
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          Colors.blue,
                                        ).onInkTap(() {
                                          if (isliked) {
                                            unlike(post.id);
                                          } else {
                                            like(post.id);
                                          }
                                        });
                                      },
                                    ),
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
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
