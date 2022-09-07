class Comment {
  late int id;
  late int userId;
  late int contentId;
  late String text;
  late String time;
  Comment.fromJson(Map<String, dynamic> json)
      : id = json["commentId"],
        userId = json["userId"],
        contentId = json["contentId"],
        text = json["commentText"],
        time = json["time"];
}
