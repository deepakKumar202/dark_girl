import 'package:dark_girl/controller/songController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Song1 extends StatefulWidget {
  const Song1({super.key, required this.index});
  final int index;

  @override
  State<Song1> createState() => _Song1State();
}

class _Song1State extends State<Song1> {
  final controller = Get.put(SongController());
  @override
  void initState() {
    final controller = Get.put(SongController());
    controller.playsong(
      urls: controller.songs.map((e) => e.downloadUrl.last.link).toList(),
      index: widget.index,
    );
    setState(() {
      image = controller.songs[widget.index].downloadUrl.last.link;
    });
    super.initState();
  }

  @override
  void dispose() {
    final controller = Get.put(SongController());
    controller.player.stop();
    super.dispose();
  }

  String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Song 1"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image)),
                  color: Colors.red,
                  borderRadius: const BorderRadius.only()),
            ),

            const SizedBox(height: 10),
            Container(
              color: Colors.transparent,
              height: Get.height * 0.12,
              width: Get.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    final song = controller.songs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            image = song.image.last.link;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(song.image.last.link)),
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.player.seekToPrevious();
                    },
                    child: const Icon(
                      Icons.skip_next,
                      size: 42,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.player.playing) {
                        controller.player.pause();
                      } else {
                        (controller.player.play());
                      }
                      setState(() {});
                    },
                    child: Icon(
                      controller.player.playing
                          ? Icons.pause_sharp
                          : Icons.play_arrow_sharp,
                      size: 42,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.player.seekToNext();
                    },
                    child: const Icon(
                      Icons.skip_next,
                      size: 42,
                    ),
                  )
                ],
              ),
            )

            // SizedBox(
            //   height: 100,
            //   width: Get.width,
            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     physics: const NeverScrollableScrollPhysics(),
            //     children: [
            //       Container(
            //           height: 88,
            //           width: 88,
            //           decoration: const BoxDecoration(color: Colors.red),
            //           child: Image(
            //               image: NetworkImage(widget.song.image.last.link))),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20),
            // Text(
            //   widget.song.name,
            //   style: const TextStyle(color: Colors.black, fontSize: 32),
            // ),
            // Container(
            //   height: 55,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     // color: Colors.red,
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       InkWell(
            //         onTap: () {},
            //         child: const Icon(
            //           Icons.skip_next,
            //           size: 42,
            //         ),
            //       ),
            //       InkWell(
            //           onTap: () {
            //             if (controller.player.playing) {
            //               controller.player.pause();
            //             } else {
            //               controller.player.play();
            //             }
            //             setState(() {});
            //           },
            //           child: Icon(
            //               controller.player.playing
            //                   ? Icons.pause_circle
            //                   : Icons.play_circle,
            //               size: 42)),
            //       InkWell(
            //           onTap: () {},
            //           child: const Icon(Icons.skip_next, size: 42)),
            //     ],
            //   ),
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
