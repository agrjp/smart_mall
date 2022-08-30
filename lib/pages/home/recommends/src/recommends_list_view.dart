import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:smart_mall/pages/home/recommends/recommend_details_screen.dart';

class RecommendsListView extends StatefulWidget {
  const RecommendsListView({Key? key}) : super(key: key);

  @override
  State<RecommendsListView> createState() => _RecommendsListViewState();
}

class _RecommendsListViewState extends State<RecommendsListView> {
  String testImageUrl =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png";
  String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";
  Random random = Random.secure();
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
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
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140 + random.nextInt(20) * 1.0,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(testImageUrl),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "碳循环第一天",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              ClipOval(
                                child: Image.network(
                                  testPic,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "我就是吱吱",
                                    style: TextStyle(fontSize: 11),
                                  )),
                              const Expanded(child: SizedBox()),
                              SvgPicture.asset("assets/svg/svg_live.svg",
                                  width: 13, height: 13),
                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Text(
                                  "10",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const RecommendDetailsScreen())));
            },
          );
        },
      ),
    );
  }
}
