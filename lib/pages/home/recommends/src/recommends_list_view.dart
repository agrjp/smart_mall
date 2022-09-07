import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smart_mall/entity/content.dart';
import 'package:smart_mall/network/easy_http.dart';

import 'package:smart_mall/pages/home/recommends/src/content_widget.dart';
import 'package:smart_mall/widget/top_tab/top_tab.dart';

class RecommendsListView extends StatefulWidget {
  const RecommendsListView({Key? key}) : super(key: key);

  @override
  State<RecommendsListView> createState() => _RecommendsListViewState();
}

class _RecommendsListViewState extends State<RecommendsListView> {
  List<Content> _list = [];
  String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";

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
    EasyHttp.instance.selectContentList().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
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
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: ContentWidget(
                          content: _list[index],
                        ));
                  },
                ))));
  }
}
