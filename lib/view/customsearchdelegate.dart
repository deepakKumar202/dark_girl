import 'package:dark_girl/model/songModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Result> songs = [];
  bool isLoading = false;

  getSongs(String value) async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse("https://saavn.me/search/songs?query=$value"));
    if (response.statusCode == 200) {
      songs = songsearchmodelFromJson(response.body).data.results;
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            getSongs(value);
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(songs[index].name),
                  leading: Image.network(
                    songs[index].image.last.link,
                    height: 50,
                    width: 50,
                  ),
                  subtitle: Text(songs[index].label),
                );
              },
            ),
    );
  }
}
