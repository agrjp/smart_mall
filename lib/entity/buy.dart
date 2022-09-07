class Buy {
  late int id;
  late int userId;
  late int goodsId;
  late String state;
  late String time;

  Buy.fromJson(Map<String, dynamic> json)
      : id = json["buyId"],
        userId = json["userId"],
        goodsId = json["commodityId"],
        state = json["logistics"],
        time = json["time"];
}
