import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuyCard extends StatefulWidget {
  const BuyCard({Key? key}) : super(key: key);

  @override
  State<BuyCard> createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
  String _imagePath =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg";
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
            children: const [
              BuyCardItem(label: "待付款", svgPath: "assets/svg/svg_payment.svg"),
              BuyCardItem(
                  label: "待发货", svgPath: "assets/svg/svg_deliver_goods.svg"),
              BuyCardItem(
                  label: "待收货", svgPath: "assets/svg/svg_receiving.svg"),
              BuyCardItem(
                  label: "售后", svgPath: "assets/svg/svg_after_sales.svg")
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: const BorderRadius.all(Radius.circular(2))),
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
  const BuyCardItem({Key? key, required this.svgPath, required this.label})
      : super(key: key);
  final String svgPath;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SvgPicture.asset(svgPath, width: 26, height: 26),
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
