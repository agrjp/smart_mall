import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'footprints_list_view.dart';
import 'footprints_top_bar.dart';

class FootprintsScreen extends StatefulWidget {
  const FootprintsScreen({Key? key}) : super(key: key);

  @override
  State<FootprintsScreen> createState() => _FootprintsScreenState();
}

class _FootprintsScreenState extends State<FootprintsScreen> {
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
                    child: FootprintsTopBar(),
                  ),
                ),
                //底部可刷新页面
                Padding(
                    padding: EdgeInsets.only(top: 38),
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
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
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      //经常浏览
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true, //无边界约束
                          itemBuilder: (context, index) {
                            return _BuildeListView(context, index);
                          }),
                    )),
              ],
            ),
          )),
    );
  }
}

Widget _BuildeListView(BuildContext context, int index) {
  int _month = 8;
  if (index == 0) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: Text("经常浏览",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                  shrinkWrap: true,
                  //无边界约束
                  physics: BouncingScrollPhysics(),
                  //回弹动画
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return FootPrintsListViewItem(size:(0.23));
                  }),
            ),
          ),
          Container(
            height: 8,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  } else {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        color: Colors.white,
        child: SizedBox(
          // height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //日期
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "0" + _month.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          " / " + (29 - index).toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //图片
              Padding(padding: EdgeInsets.only(left: 10),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
                children: _BuildWarp(),
              ),),
              SizedBox(height: 10,),
              Container(
                height: 8,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _BuildWarp (){
  int num;
  List<Widget> WarpList= [];
  num=Random().nextInt(5);
  num=(num==0?1:num);
  for(int i=0;i<num;i++){
    WarpList.add(FootPrintsListViewItem(size:0.3));
  }
  return WarpList;
}
