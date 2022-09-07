class User {
  late int uuid;
  late String picture = "http://192.168.0.108:8080/user/u1.jpg";
  late String userName = "";
  late String telephone;
  User();

  User.fromJson(Map<String, dynamic> json)
      : uuid = json["userId"],
        picture = "http://${json["photo"]}",
        userName = json["userName"],
        telephone = json["telephone"];
}
