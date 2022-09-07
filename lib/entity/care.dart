class Care {
  late int id;
  late int userId;
  late int otherId;
  Care.fromJson(Map<String, dynamic> json)
      : id = json["careId"],
        userId = json["userId"],
        otherId = json["otherId"];
}
