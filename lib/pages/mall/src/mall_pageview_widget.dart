import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';

import 'package:smart_mall/pages/mall/goods_details/goods_details_screen.dart';
import 'package:smart_mall/pages/mall/src/goods_list_view.dart';
import 'package:smart_mall/pages/mall/src/mall_second_tab.dart';

class MallPageViewWidget extends StatefulWidget {
  const MallPageViewWidget({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  State<MallPageViewWidget> createState() => _MallPageViewWidgetState();
}

class _MallPageViewWidgetState extends State<MallPageViewWidget> {
  final String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture/WechatIMG95.jpeg";
  List<Goods> _goodsList = [];
  List<Buy> _buyList = [];
  final List<String> _bannerList = [];
  @override
  void initState() {
    super.initState();
    _bannerList.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg");

    _bannerList.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG86.jpeg");

    _bannerList.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG87.jpeg");
    super.initState();

    EasyHttp.instance.selectGoodsByType(widget.type).then((value) {
      setState(() {
        _goodsList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            height: 77,
            child: Swiper(
              autoplay: true,
              itemCount: _bannerList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            _bannerList[index],
                          ))),
                );
              },
            ),
          ),
          //second tab
          const MallSecondTab(),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Color.fromARGB(255, 241, 241, 241)),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  padding: const EdgeInsets.only(top: 2, bottom: 2),
                  child: const Text(
                    "得物",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "先鉴别 在发货",
                      style: TextStyle(
                          fontSize: 11.5, fontWeight: FontWeight.bold),
                    )),
                const Expanded(child: SizedBox()),
                const Text(
                  "在得物买的商品都会查验鉴别吗？",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                )
              ],
            ),
          ),
          //item
          GoodsListView(goodsList: _goodsList)
        ],
      ),
    );
  }
}
