import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/callback.dart';
import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/my/buy_details/buy_card_details_screen.dart';

class BuyCard extends StatefulWidget {
  const BuyCard({Key? key}) : super(key: key);

  @override
  State<BuyCard> createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
  final String _imagePath =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg";
  List<Buy> _buyList = [];
  int signForCount = 0;
  int deliverGoodsCount = 0;
  int receivingCount = 0;
  @override
  void initState() {
    super.initState();
    EasyHttp.instance.selectBuyByUserId(UserInfo.user.uuid).then((value) {
// ignore: unused_local_variable
      for (var element in value) {
        if (element.state == "已签收") {
          signForCount++;
        } else if (element.state == "待发货") {
          deliverGoodsCount++;
        } else if (element.state == "待收货") {
          receivingCount++;
        }
      }

      setState(() {
        _buyList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "购物",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BuyDetailsScreen(
                             index: 0,
                          )
                          )));
                },
                child: BuyCardItem(
                  label: "已签收",
                  svgPath: "assets/svg/svg_sign_for.svg",
                  count: signForCount,
                  isShowCount: false,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BuyDetailsScreen(
                            index: 1,
                          )
                          )));
                },
                child: BuyCardItem(
                  label: "待发货",
                  svgPath: "assets/svg/svg_deliver_goods.svg",
                  count: deliverGoodsCount,
                  isShowCount: true,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BuyDetailsScreen(
                            index: 2,
                          )
                          )));
                },
                child: BuyCardItem(
                  label: "待收货",
                  svgPath: "assets/svg/svg_receiving.svg",
                  count: deliverGoodsCount,
                  isShowCount: true,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const BuyDetailsScreen(
                            index: 3,
                          )
                          )));
                },
                child: const BuyCardItem(
                  label: "售后",
                  svgPath: "assets/svg/svg_after_sales.svg",
                  count: 0,
                  isShowCount: false,
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.network(
                  _imagePath,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "运输中",
                              style: TextStyle(fontSize: 12),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "08-30 06:50",
                                style: TextStyle(
                                    fontSize: 11.5, color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text(
                              "[广州]快件到达[项目营业部]",
                              style:
                                  TextStyle(fontSize: 11.5, color: Colors.grey),
                            ))
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BuyCardItem extends StatelessWidget {
  const BuyCardItem(
      {Key? key,
      required this.svgPath,
      required this.label,
      required this.count,
      required this.isShowCount})
      : super(key: key);
  final String svgPath;
  final String label;
  final int count;
  final bool isShowCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SvgPicture.asset(
            svgPath,
            width: 26,
            height: 26,
            color: isShowCount
                ? const Color.fromARGB(255, 42, 196, 142)
                : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 109, 107, 107)),
            ),
          )
        ],
      ),
    );
  }
}
