import 'dart:convert';

import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/care.dart';
import 'package:smart_mall/entity/comment.dart';
import 'package:smart_mall/entity/content.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/entity/user.dart';
import 'package:smart_mall/network/http.dart';

class EasyHttp {
  static final EasyHttp instance = EasyHttp._instance();

  EasyHttp._instance();

  //user
  Future<User> selectUserById(int id) async {
    User user = User();
    await Http.instance.get("user", {"id": id}).then((value) {
      Map<String, dynamic> responseMap = json.decode(value.toString());
      user = User.fromJson(responseMap);
    });
    return user;
  }

  Future<User> selectUserByTelephone(String tel) async {
    User user = User();
    await Http.instance.get("userT", {"telephone": tel}).then((value) {
      Map<String, dynamic> responseMap = json.decode(value.toString());
      user = User.fromJson(responseMap);
    });
    return user;
  }

//content
  Future<List<Content>> selectContentList() async {
    List<Content> list = [];
    await Http.instance.get("contentList", {}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Content.fromJson(m));
      }
    });
    return list;
  }

  Future<List<Content>> selectContentByUserId(int id) async {
    List<Content> list = [];
    await Http.instance.get("user_content", {"userId": id}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Content.fromJson(m));
      }
    });
    return list;
  }

//likes
  Future<int> selectContentLikes(int contentId) async {
    int count = 0;
    await Http.instance
        .get("contentLikes", {"contentId": contentId}).then((value) {
      count = int.parse(value.data);
    });
    return count;
  }

  //goods
  Future<List<Goods>> selectGoodsByType(String type) async {
    List<Goods> list = [];
    await Http.instance.get("search", {"type": type}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Goods.fromJson(m));
      }
    });
    return list;
  }

  Future<Goods> selectGoodsByGoodsId(int id) async {
    Goods good = Goods();
    await Http.instance.get("commodity", {"id": id}).then((value) {
      Map<String, dynamic> responseMap = json.decode(value.toString());
      good = Goods.fromJson(responseMap);
    });
    return good;
  }

  Future<List<Goods>> selectGoodsByIDAndStatus(String status,int userId) async {
    List<Goods> list = [];
    await Http.instance.get("searchLogistics", {"logistics": status,"id":userId}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Goods.fromJson(m));
      }
    });
    return list;
  }

//comment
  Future<List<Comment>> selectCommentByContentId(int id) async {
    List<Comment> list = [];
    await Http.instance
        .get("contentUserComment", {"contentId": id}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Comment.fromJson(m));
      }
    });
    return list;
  }

  //buy
  Future<List<Buy>> selectBuyByGoodsId(int goodsId) async {
    List<Buy> list = [];
    await Http.instance
        .get("commodityBuy", {"commodityId": goodsId}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Buy.fromJson(m));
      }
    });
    return list;
  }

  Future<List<Buy>> selectBuyByUserId(int userId) async {
    List<Buy> list = [];
    await Http.instance.get("userBuy", {"userId": userId}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Buy.fromJson(m));
      }
    });
    return list;
  }

  //care 直接返回所有的数据-不太好
  Future<List<Care>> selectCareList() async {
    List<Care> list = [];
    await Http.instance.get("careList", {}).then((value) {
      List<dynamic> responseList = json.decode(value.toString());
      for (var m in responseList) {
        list.add(Care.fromJson(m));
      }
    });
    return list;
  }

  //order
  postOrderData(int userID,int goodID) async{
    await Http.instance.post("buyCommodity", {"userId":userID , "commodityId":goodID});
  }
}
