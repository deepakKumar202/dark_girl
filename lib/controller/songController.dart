import 'package:dark_girl/model/songModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class SongController extends GetxController {
  List<Result> songs = [];

  final player = AudioPlayer();

  playsong({required List<String> urls, required int index}) async {
    await player.setAudioSource(
      ConcatenatingAudioSource(
        children: [for (String link in urls) AudioSource.uri(Uri.parse(link))],
      ),
      initialIndex: index,
    );

    await player.play();
  }

  SongController() {
    getSongs();
  }

  getSongs() async {
    final response = await http
        .get(Uri.parse("https://saavn.me/search/songs?query=khesarilal"));
    if (response.statusCode == 200) {
      songs = songsearchmodelFromJson(response.body).data.results;
      update();
    }
  }
}
