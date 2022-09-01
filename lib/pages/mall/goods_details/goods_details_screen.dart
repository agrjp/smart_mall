import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/theme.dart';
import 'package:smart_mall/pages/mall/goods_details/goods_details_bottom_window.dart';
import 'package:smart_mall/pages/mall/goods_details/goods_details_card.dart';
import 'package:smart_mall/pages/mall/goods_details/recency_buy_card.dart';

class GoodsDetailsScreen extends StatefulWidget {
  const GoodsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<GoodsDetailsScreen> createState() => _GoodsDetailsScreenState();
}

class _GoodsDetailsScreenState extends State<GoodsDetailsScreen> {
  final String _imagePath =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG86.jpeg";
  int _swiperIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConstants.backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Stack(
                    children: [
                      Swiper(
                        autoplay: true,
                        itemCount: 10,
                        duration: 500,
                        autoplayDelay: 2000,
                        itemBuilder: (content, index) {
                          return Image.network(
                            _imagePath,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          );
                        },
                        onIndexChanged: (index) {
                          setState(() {
                            _swiperIndex = index;
                          });
                        },
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin:
                                const EdgeInsets.only(bottom: 12, right: 12),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            alignment: Alignment.center,
                            width: 45,
                            height: 19,
                            child: Text(
                              "${_swiperIndex + 1}/${10}",
                              style: const TextStyle(
                                  fontSize: 10.5,
                                  letterSpacing: 2,
                                  color: Colors.grey),
                            ),
                          )),
                    ],
                  ),
                ),
                const GoodsDetailsCard(),
                const RecencyBuyCard(),
                const SizedBox(
                  height: 100,
                )
              ],
            )),
            //返回按钮
            Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )),
            //底部功能框
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).padding.bottom + 10,
                      top: 10),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset("assets/svg/svg_collection.svg",
                              width: 20, height: 20),
                          const Text("想要")
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/svg/svg_collection.svg",
                                  width: 20, height: 20),
                              const Text("我有")
                            ],
                          )),
                      const Expanded(child: SizedBox()),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 12, bottom: 12),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 243, 243),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: const Text(
                          "出售",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.only(
                              left: 45, right: 45, top: 12, bottom: 12),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 10, 198, 198),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: const Text(
                            "立即购买",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          //高度只能是屏幕的1/2
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const GoodsDetailBottomWindow();
                              },
                              backgroundColor: Colors.transparent);
                        },
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
