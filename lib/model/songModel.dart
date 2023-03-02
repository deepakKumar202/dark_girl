// To parse this JSON data, do
//
//     final songsearchmodel = songsearchmodelFromJson(jsonString);

import 'dart:convert';

Songsearchmodel songsearchmodelFromJson(String str) =>
    Songsearchmodel.fromJson(json.decode(str));

String songsearchmodelToJson(Songsearchmodel data) =>
    json.encode(data.toJson());

class Songsearchmodel {
  Songsearchmodel({
    required this.status,
    this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory Songsearchmodel.fromJson(Map<String, dynamic> json) =>
      Songsearchmodel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.total,
    required this.start,
    required this.results,
  });

  int total;
  int start;
  List<Result> results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        start: json["start"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "start": start,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.type,
    required this.album,
    required this.year,
    this.releaseDate,
    required this.duration,
    required this.label,
    required this.primaryArtists,
    required this.primaryArtistsId,
    required this.featuredArtistsId,
    required this.explicitContent,
    required this.playCount,
    required this.hasLyrics,
    required this.url,
    required this.copyright,
    required this.image,
    required this.downloadUrl,
  });

  String id;
  String name;
  String type;
  Album album;
  String year;
  dynamic releaseDate;
  String duration;
  String label;
  String primaryArtists;
  String primaryArtistsId;
  String featuredArtistsId;
  int explicitContent;
  String playCount;
  String hasLyrics;
  String url;
  String copyright;
  List<DownloadUrl> image;
  List<DownloadUrl> downloadUrl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        album: Album.fromJson(json["album"]),
        year: json["year"],
        releaseDate: json["releaseDate"],
        duration: json["duration"],
        label: json["label"],
        primaryArtists: json["primaryArtists"],
        primaryArtistsId: json["primaryArtistsId"],
        featuredArtistsId: json["featuredArtistsId"],
        explicitContent: json["explicitContent"],
        playCount: json["playCount"],
        hasLyrics: json["hasLyrics"],
        url: json["url"],
        copyright: json["copyright"],
        image: List<DownloadUrl>.from(
            json["image"].map((x) => DownloadUrl.fromJson(x))),
        downloadUrl: List<DownloadUrl>.from(
            json["downloadUrl"].map((x) => DownloadUrl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "album": album.toJson(),
        "year": year,
        "releaseDate": releaseDate,
        "duration": duration,
        "label": label,
        "primaryArtists": primaryArtists,
        "primaryArtistsId": primaryArtistsId,
        "featuredArtistsId": featuredArtistsId,
        "explicitContent": explicitContent,
        "playCount": playCount,
        "hasLyrics": hasLyrics,
        "url": url,
        "copyright": copyright,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "downloadUrl": List<dynamic>.from(downloadUrl.map((x) => x.toJson())),
      };
}

class Album {
  Album({
    required this.id,
    required this.name,
    required this.url,
  });

  String id;
  String name;
  String url;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class DownloadUrl {
  DownloadUrl({
    required this.quality,
    required this.link,
  });

  Quality quality;
  String link;

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
        quality: qualityValues.map[json["quality"]]!,
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "quality": qualityValues.reverse[quality],
        "link": link,
      };
}

enum Quality {
  THE_12_KBPS,
  THE_48_KBPS,
  THE_96_KBPS,
  THE_160_KBPS,
  THE_320_KBPS,
  THE_50_X50,
  THE_150_X150,
  THE_500_X500
}

final qualityValues = EnumValues({
  "12kbps": Quality.THE_12_KBPS,
  "150x150": Quality.THE_150_X150,
  "160kbps": Quality.THE_160_KBPS,
  "320kbps": Quality.THE_320_KBPS,
  "48kbps": Quality.THE_48_KBPS,
  "500x500": Quality.THE_500_X500,
  "50x50": Quality.THE_50_X50,
  "96kbps": Quality.THE_96_KBPS
});

enum FeaturedArtists { SHILPI_RAJ, EMPTY }

final featuredArtistsValues = EnumValues(
    {"": FeaturedArtists.EMPTY, "Shilpi Raj": FeaturedArtists.SHILPI_RAJ});

enum Language { BHOJPURI }

final languageValues = EnumValues({"bhojpuri": Language.BHOJPURI});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
