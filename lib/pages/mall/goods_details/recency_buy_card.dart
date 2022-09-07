import 'package:flutter/material.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/entity/user.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/util/data_util.dart';

class RecencyBuyCard extends StatefulWidget {
  const RecencyBuyCard({Key? key, required this.goods}) : super(key: key);
  final Goods goods;
  @override
  State<RecencyBuyCard> createState() => _RecencyBuyCardState();
}

class _RecencyBuyCardState extends State<RecencyBuyCard> {
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
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "最近购买(${_buyList.length})",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _buyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: RecencyBuyItem(
                        buy: _buyList[index],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class RecencyBuyItem extends StatefulWidget {
  const RecencyBuyItem({Key? key, required this.buy}) : super(key: key);
  final Buy buy;
  @override
  State<RecencyBuyItem> createState() => _RecencyBuyItemState();
}

class _RecencyBuyItemState extends State<RecencyBuyItem> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            ClipOval(
                child: Image.network(
              user.picture,
              fit: BoxFit.fill,
              width: 15,
              height: 15,
            )),
            Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  user.userName,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                )),
          ],
        )),
        const Expanded(
            child: Text(
          "36",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )),
        const Expanded(
            child: Text(
          "¥499",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )),
        Expanded(
            child: Text(
          DateUtil.fromUtc(widget.buy.time),
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ))
      ],
    );
  }
}
