import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/entity/buy.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/network/easy_http.dart';

import 'order_card.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {

  List<Buy> _buyList = [];
  var userId = UserInfo.user.uuid;
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //异步！！
    EasyHttp.instance.selectBuyByUserId(userId).then((value) {
      setState(() {
        _buyList = value;
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
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("松手加载更多");
            } else {
              body = const Text("没有更多数据了");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.85,
        child: ListView.builder(
            shrinkWrap: true,//无边界约束
            // physics: NeverScrollableScrollPhysics(),
            itemCount: _buyList.length,
            itemBuilder: (context,index){return OrderCard(buy: _buyList[index]);}),
      )
    );
  }
}
