class Goods {
  late int id;
  late int price = 0;
  late String name = "";
  late List<String> photos = ["evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png"];
  late String introduce;
  late String type;
  Goods();

  Goods.fromJson(Map<String, dynamic> json)
      : id = json["commodityId"],
        price = json["price"],
        name = json["comName"],
        photos = json["comPhotos"].toString().split(";"),
        introduce = json["introduce"],
        type = json["type"];
}
