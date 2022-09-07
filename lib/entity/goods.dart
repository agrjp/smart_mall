class Goods {
  late int id;
  late int price;
  late String name;
  late List<String> photos;
  late String introduce;
  late String type;
  Goods.fromJson(Map<String, dynamic> json)
      : id = json["commodityId"],
        price = json["price"],
        name = json["comName"],
        photos = json["comPhotos"].toString().split(";"),
        introduce = json["introduce"],
        type = json["type"];
}
