import 'package:flutter/material.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/mall/goods_details/goods_details_screen.dart';

class GoodsItem extends StatefulWidget {
  const GoodsItem({Key? key, required this.goods}) : super(key: key);
  final Goods goods;
  @override
  State<GoodsItem> createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  int buyLength = 0;
  @override
  void initState() {
    super.initState();
    EasyHttp.instance.selectBuyByGoodsId(widget.goods.id).then((value) {
      setState(() {
        buyLength = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "http://${widget.goods.photos[0]}",
              width: MediaQuery.of(context).size.width - 20,
              height: 220,
              fit: BoxFit.fill,
            ),
            Text(widget.goods.name,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Row(
              children: [
                Text("¥${widget.goods.price}",
                    style: const TextStyle(
                        fontSize: 13.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const Expanded(child: SizedBox()),
                Text("$buyLength人付款",
                    style: const TextStyle(
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
                builder: ((context) => GoodsDetailsScreen(
                      goods: widget.goods,
                    ))));
      },
    );
  }
}
