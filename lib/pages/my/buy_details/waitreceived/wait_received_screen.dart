import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/my/buy_details/all/order_card.dart';
import 'package:smart_mall/pages/my/buy_details/waitreceived/wait_received_card.dart';
import 'package:smart_mall/pages/my/buy_details/waitsend/wait_send_card.dart';

class WaitReceivedScreen extends StatefulWidget {
  const WaitReceivedScreen({Key? key}) : super(key: key);

  @override
  State<WaitReceivedScreen> createState() => _WaitReceivedScreenState();
}

class _WaitReceivedScreenState extends State<WaitReceivedScreen> {

  List<Goods> _waitPayList = [];
  var userId = UserInfo.user.uuid;
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //异步！！
    EasyHttp.instance.selectGoodsByIDAndStatus("待收货",userId).then((value) {
      setState(() {
        _waitPayList = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(
          complete: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.check_circle,
                size: 18,
                color: Colors.grey,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    "刷新完成",
                    style: TextStyle(fontSize: 12),
                  )),
            ],
          ),
        ),
        onRefresh: _onRefresh,
        child: Container(
          width: MediaQuery.of(context).size.width,
          //过长底部不显示
          height: MediaQuery.of(context).size.height*0.85,
          child: ListView.builder(
            //shrinkWrap: true,//无边界约束
            // physics: NeverScrollableScrollPhysics(),
              itemCount: _waitPayList.length,
              itemBuilder: (context,index){return WaitReceivedCard(goods: _waitPayList[index]);}),
        )
    );
  }
}
