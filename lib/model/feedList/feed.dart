// To parse this JSON data, do
//
//     final feed = feedFromJson(jsonString);


class Feed {
  Feed({
    this.id,
    this.createdAt,
    this.likes,
    this.image,
    this.owner,
    this.avatar,
    this.comments,
  });

  String id;
  DateTime createdAt;
  int likes;
  Image image;
  String owner;
  String avatar;
  List<Comment> comments;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    likes: json["likes"],
    image: Image.fromJson(json["image"]),
    owner: json["owner"],
    avatar: json["avatar"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "likes": likes,
    "image": image.toJson(),
    "owner": owner,
    "avatar": avatar,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.id,
    this.postId,
    this.createdAt,
    this.comment,
    this.owner,
    this.avatar,
  });

  String id;
  String postId;
  DateTime createdAt;
  String comment;
  String owner;
  String avatar;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    postId: json["postId"],
    createdAt: DateTime.parse(json["createdAt"]),
    comment: json["comment"],
    owner: json["owner"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "postId": postId,
    "createdAt": createdAt.toIso8601String(),
    "comment": comment,
    "owner": owner,
    "avatar": avatar,
  };
}

class Image {
  Image({
    this.url,
  });

  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
