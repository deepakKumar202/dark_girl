class PostModel {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String userName;
  final String userImage;
  final String userId;
  final int dateTime;
  final List<String> videos;
  // final List<Likes> likes;
  // final List<Comments> comments;
  // final List<Gifts> gifts;

  PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.userName,
    required this.userImage,
    required this.userId,
    required this.dateTime,
    required this.videos,
    // required this.likes,
    // required this.comments,
    // required this.gifts,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: json['images'].map<String>((e) => e.toString()).toList(),
      userName: json['userName'],
      userImage: json['userImage'],
      userId: json['userId'],
      dateTime: json['dateTime'],
      videos: json['videos'].map<String>((e) => e.toString()).toList(),
      // likes: json['likes'].map<Likes>((e) => Likes.fromJson(e)).toList(),
      // comments:
      // json['comments'].map<Comments>((e) => Comments.fromJson(e)).toList(),
      // gifts: json['gifts'].map<Gifts>((e) => Gifts.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'userName': userName,
      'userImage': userImage,
      'userId': userId,
      'dateTime': dateTime,
      'videos': videos,
      // 'likes': likes.map((e) => e.toJson()).toList(),
      // 'comments': comments.map((e) => e.toJson()).toList(),
      // 'gifts': gifts.map((e) => e.toJson()s).toList(),
    };
  }
}

class Gifts {
  final String userId;
  final String userName;
  final String userImage;
  final String giftId;
  final String giftName;
  final String giftImage;
  final int dateTime;

  Gifts({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.giftId,
    required this.giftName,
    required this.giftImage,
    required this.dateTime,
  });

  factory Gifts.fromJson(Map<String, dynamic> json) {
    return Gifts(
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      giftId: json['giftId'],
      giftName: json['giftName'],
      giftImage: json['giftImage'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'giftId': giftId,
      'giftName': giftName,
      'giftImage': giftImage,
      'dateTime': dateTime,
    };
  }
}

// Likes Model

class Likes {
  final String userId;
  final String userName;
  final String userImage;
  final int dateTime;

  Likes({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.dateTime,
  });

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'dateTime': dateTime,
    };
  }
}

class Comments {
  final String userId;
  final String userName;
  final String userImage;
  final String comment;
  final int dateTime;

  Comments({
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.comment,
    required this.dateTime,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      comment: json['comment'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'comment': comment,
      'dateTime': dateTime,
    };
  }
}
