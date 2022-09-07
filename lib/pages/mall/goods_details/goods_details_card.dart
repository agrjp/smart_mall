import 'package:flutter/material.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';

class GoodsDetailsCard extends StatefulWidget {
  const GoodsDetailsCard({Key? key, required this.goods}) : super(key: key);
  final Goods goods;
  @override
  State<GoodsDetailsCard> createState() => _GoodsDetailsCardState();
}

class _GoodsDetailsCardState extends State<GoodsDetailsCard> {
  List<Buy> _buyList = [];
  @override
  void initState() {
    super.initState();
    EasyHttp.instance.selectBuyByGoodsId(widget.goods.id).then((value) {
      setState(() {
        _buyList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "¥${widget.goods.price}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Text(_buyList.length.toString() + "人付款",
                  style: TextStyle(fontSize: 11, color: Colors.grey)),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("1.8万+想要",
                      style: TextStyle(fontSize: 11, color: Colors.grey)))
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              "最低每日1.19元，立即开通",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Text(
            widget.goods.name,
            style: const TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 95, 93, 93)),
          )
        ],
      ),
    );
  }
}
