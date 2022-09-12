import 'package:flutter/material.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';

class OrderCard extends StatefulWidget {
  const OrderCard( {Key? key,required this.buy}) : super(key: key);
  final Buy buy;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  var image_url =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png";
  String time = "";
  String size = "";
   Goods _buyGoods = Goods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.buy.time);
    EasyHttp.instance.selectGoodsByGoodsId(widget.buy.goodsId).then((value) {
      if(mounted){
        setState(() {
          _buyGoods = value;
          time = int.parse(widget.buy.time.split("-")[1]).toString()+"."+int.parse(widget.buy.time.split("-")[2].split("T")[0]).toString();
          if(_buyGoods.type == "鞋类"){
            size="42";
          }else if(_buyGoods.type == "潮服"){
            size="L";
          }else if(_buyGoods.type == "配饰"){
            size="均码";
          }else if(_buyGoods.type == "推荐"){
            size="普通款";
          }else if(_buyGoods.type == "手表"){
            size="经典款";
          }
          // print(_buyGoods.type);
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//横
        crossAxisAlignment: CrossAxisAlignment.start,//纵
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 6,
          ),
          SizedBox(height: 5,),
          Text("交易成功"),
          Container(
            color: Colors.grey.shade400,
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              //订单卡主体
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,//背景色
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border:  Border.all(width: 1,color: Colors.grey.shade400),//边框色
                  ),
                  //图片框
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          color: Colors.black,
                          child: Text(
                            "预计$time送达",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Image.network(
                        "http://${_buyGoods.photos[0]}",
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      //商品信息
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            (_buyGoods.name)),
                        Text("$size 数量x1"),
                        Text("￥"+(_buyGoods.price).toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade400,
            height: 1,
          ),
          const SizedBox(height: 5,),
          Row(
            //三个按钮
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text("  卖了换钱  "),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: new Border.all(width: 1,color: Colors.grey),
                ),
              ),
              SizedBox(width: 5,),
              Container(
                child: Text("  晒单有礼  "),
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: new Border.all(width: 1,color: Colors.grey),
                ),
              ),
              SizedBox(width: 5,),
              Container(
                child: Text("      评价      "),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: new Border.all(width: 1,color: Colors.grey),
                ),
              ),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
