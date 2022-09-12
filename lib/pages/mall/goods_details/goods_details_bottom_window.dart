import 'package:flutter/material.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/pages/my/pay/pay_page.dart';

class GoodsDetailBottomWindow extends StatefulWidget {
  const GoodsDetailBottomWindow({Key? key,required this.goods}) : super(key: key);
  final Goods goods;
  @override
  State<GoodsDetailBottomWindow> createState() =>
      _GoodsDetailBottomWindowState();
}

class _GoodsDetailBottomWindowState extends State<GoodsDetailBottomWindow> {
  String testImageUrl =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.network(
                  "http://${widget.goods.photos[0]}",
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                "￥"+widget.goods.price.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12), child: Text("颜色")),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PayPage(goods: widget.goods))));
                    },
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 10, 198, 198),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                             "￥"+widget.goods.price.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 3, right: 3),
                            width: 1,
                            height: 13,
                            color: Colors.grey,
                          ),
                          const Text(
                            "约2天到",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 246, 246, 246),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                height: 60,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "￥"+(widget.goods.price-110).toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 3, right: 3),
                      width: 1,
                      height: 13,
                      color: Colors.grey,
                    ),
                    const Text(
                      "约5-6天到",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
