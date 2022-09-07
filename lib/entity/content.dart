class Content {
  late int contentId;
  late int userId;
  late List<String> photos;
  late String title;
  late String text;
  late String time;
  Content();
  Content.fromJson(Map<String, dynamic> json)
      : contentId = json["contentId"],
        userId = json["userId"],
        photos = json["conPhotos"].toString().split(";"),
        title = json["title"],
        text = json["contentText"],
        time = json["conTime"];
}
