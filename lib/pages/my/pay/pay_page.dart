import 'package:flutter/material.dart';
import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/my/pay/pay_page_top_bar.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key, required this.goods}) : super(key: key);
  final Goods goods;

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  String size = "";
  var image_url =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.goods.type == "鞋类") {
      size = "42";
    } else if (widget.goods.type == "潮服") {
      size = "L";
    } else if (widget.goods.type == "配饰") {
      size = "均码";
    } else if (widget.goods.type == "推荐") {
      size = "普通款";
    } else if (widget.goods.type == "手表") {
      size = "经典款";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              //顶部工具栏
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: PayPageTopBar(),
                ),
              ),
              //页面滚动组件
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        //地址card
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text("广东省 深圳市 光明区"),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text("康佳光明科技中心"),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text("陶云浩 165****3212"),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 22,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //合并下单card
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Text("合并下单"),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 5, left: 10),
                                          child: Container(
                                            color: Colors.deepOrange[50],
                                            child: Text(
                                              "节省1笔运费",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepOrange[700]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 22,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //详情card
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //黑白字栏行
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                bottomLeft: Radius.circular(4)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "品牌专供",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "品牌直发",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        '计划9月4日送达',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                //晚到必赔行
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width*0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.shield_outlined,
                                                color: Colors.teal,
                                                size: 15,
                                              ),
                                              //晚到必赔
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "晚到必赔",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              //9月4日未送达，平台将进行赔付
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "9月4日未送达，平台将进行赔付",
                                                  style: TextStyle(
                                                      color: Colors.grey[900],
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //跳转图标
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                //商品信息行
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //缩略图
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.21,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.21,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2)),
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                        ),
                                        child: Image.network(
                                          "http://${widget.goods.photos[0]}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      //信息
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //名称价格
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    child: Text(
                                                      widget.goods.name,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                      fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "￥" +
                                                        widget.goods.price
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //数量大小 再买一件按钮
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      "$size  数量x1",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.clip,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(2)),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade400),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 6,
                                                        ),
                                                        child: Text(
                                                          "+",
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade400),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(3),
                                                        child: Text(
                                                          "再买一件",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //标签
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 5,
                                                ),
                                                child: Wrap(
                                                  direction: Axis.horizontal,
                                                  spacing: 2,
                                                  runSpacing: 2,
                                                  children: _BuildWarp(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                //可选项
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text("退运服务"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            "退货可减免寄回运费丨",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "查看详情",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Text("￥4.53"),
                                        Icon(
                                          Icons.circle_outlined,
                                          size: 15,
                                          color: Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text("运费"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 38,
                                          ),
                                          child: Text(
                                            "包邮活动",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Text("￥0.00"),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text("优惠"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 38,
                                          ),
                                          child: Text(
                                            "限时8.6折",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Text(
                                          "-￥30.00",
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text("代金券"),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Text("不可使用代金券"),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 10, left: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Text("共1件 小计:"),
                                        Text("￥" +
                                            widget.goods.price.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                //防挡
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //底部标签
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //左字
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Text(
                                "共1件丨合计:",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "￥" + (widget.goods.price - 30).toString(),
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //右按钮
                      Container(
                        // color: Colors.cyan,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          child: Text("确认购买？"),
                                        ),
                                        actions: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              EasyHttp.instance.postOrderData(
                                                  UserInfo.user.uuid,
                                                  widget.goods.id);
                                              Navigator.pop(context);
                                            },
                                            child: Text("确定"),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("取消"),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.tealAccent[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Text("提交订单"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _BuildWarp() {
  List<Widget> WarpList = [];
  WarpList.add(
    Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 2, left: 2),
          child: Text(
            "假一赔三",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        )),
  );
  WarpList.add(
    Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 2, left: 2),
          child: Text(
            "超时赔付",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        )),
  );
  WarpList.add(
    Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 2, left: 2),
          child: Text(
            "品牌直发包装",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        )),
  );
  WarpList.add(
    Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 2, left: 2),
          child: Text(
            "7天无理由退货",
            style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        )),
  );
  return WarpList;
}
