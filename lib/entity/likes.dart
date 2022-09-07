class Likes {
  late int likesId;
  late int contentId;
  late int userId;

  Likes.fromJson(Map<String, dynamic> json)
      : likesId = json["likesId"],
        contentId = json["contentId"],
        userId = json["userId"];
}
