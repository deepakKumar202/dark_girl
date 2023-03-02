import 'package:dark_girl/controller/songController.dart';
import 'package:dark_girl/view/widgets/song1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customsearchdelegate.dart';

class SongDesign extends StatefulWidget {
  const SongDesign({super.key});

  @override
  State<SongDesign> createState() => _SongDesignState();
}

class _SongDesignState extends State<SongDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchPage());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        title: const Text("Best Song"),
      ),
      body: GetBuilder<SongController>(
          init: SongController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.songs.length,
              itemBuilder: (BuildContext context, int index) {
                final song = controller.songs[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      // if (!controller.player.playing) {
                      //   controller.playsong(url: song.downloadUrl.first.link);
                      // } else {
                      //   controller.player.stop();
                      // }
                      Get.to(Song1(index: index));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                            image: DecorationImage(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              image: NetworkImage(song.image.last.link),
                            ),
                          ),
                        ),
                        Text(
                          song.name,
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

//  if (!controller.player.playing) {
//                             controller.playsong(
//                                 url: song.downloadUrl.first.link);
//                           } else {
//                             controller.player.stop();
//                           }
