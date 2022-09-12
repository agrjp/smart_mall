import 'package:flutter/material.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';

class WaitReceivedCard extends StatefulWidget {
  const WaitReceivedCard({Key? key,required this.goods}) : super(key: key);
  final Goods goods;
  @override
  State<WaitReceivedCard> createState() => _WaitReceivedCardState();
}

class _WaitReceivedCardState extends State<WaitReceivedCard> {
  var image_url =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png";
  String size = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      setState(() {
        if(widget.goods.type == "鞋类"){
          size="42";
        }else if(widget.goods.type == "潮服"){
          size="L";
        }else if(widget.goods.type == "配饰"){
          size="均码";
        }else if(widget.goods.type == "推荐"){
          size="普通款";
        }else if(widget.goods.type == "手表"){
          size="经典款";
        }
        // print(_buyGoods.type);
      });
    }

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
                    child: Image.network(
                      "http://${widget.goods.photos[0]}",
                      fit: BoxFit.fill,
                    )
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
                            (widget.goods.name)),
                        Text("$size 数量x1"),
                        Text("￥"+(widget.goods.price).toString())
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
                child: Text("  运输中...  "),
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
