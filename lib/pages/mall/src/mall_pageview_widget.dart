import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:smart_mall/pages/mall/goods_details/goods_details_screen.dart';
import 'package:smart_mall/pages/mall/src/mall_second_tab.dart';

class MallPageViewWidget extends StatefulWidget {
  const MallPageViewWidget({Key? key}) : super(key: key);

  @override
  State<MallPageViewWidget> createState() => _MallPageViewWidgetState();
}

class _MallPageViewWidgetState extends State<MallPageViewWidget> {
  final String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture/WechatIMG95.jpeg";
  final List<String> _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg");

    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG86.jpeg");

    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG87.jpeg");
    super.initState();
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
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            _list[index],
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
          MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 13, right: 13, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              testPic,
                              width: MediaQuery.of(context).size.width - 20,
                              height: 220,
                              fit: BoxFit.fill,
                            ),
                            const Text("Air jordan legacy 312 Low (GS)爆裂纹 白",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            Row(
                              children: const [
                                Text("¥2069",
                                    style: TextStyle(
                                        fontSize: 13.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Expanded(child: SizedBox()),
                                Text("1.9万+付款",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const GoodsDetailsScreen())));
                      },
                    );
                  })),
        ],
      ),
    );
  }
}
