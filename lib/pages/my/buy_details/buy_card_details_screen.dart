import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smart_mall/constants/callback.dart';
import 'package:smart_mall/pages/my/buy_details/received/received_screen.dart';
import 'package:smart_mall/pages/my/buy_details/waitreceived/wait_received_screen.dart';
import 'package:smart_mall/pages/my/buy_details/waitsend/wait_send_screen.dart';
import 'All/all_screen.dart';
import 'buy_card_details_top_bar.dart';
import 'buy_card_details_top_tap.dart';

class BuyDetailsScreen extends StatefulWidget {
  const BuyDetailsScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<BuyDetailsScreen> createState() => _BuyDetailsScreenState();
}

class _BuyDetailsScreenState extends State<BuyDetailsScreen> {
  late final PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _index= widget.index;
    _pageController = PageController(initialPage: _index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
        child: SizedBox(
          height: double.infinity, //子元素撑满父元素
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                //确定子控件在父布局中的位置
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: BuyDetailsTopBar(), //顶部工具栏
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 38, left: 20, right: 20),
                    child: BuyDetailsTopTap(//顶部滑动Text
                        index: _index,
                        onClickListener: (index) {
                          _pageController.jumpToPage(index);
                        }),
                  ),
                  Expanded(
                    child: PageView(
                      //横向滑动页面
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      //边缘反弹
                      pageSnapping: true,
                      //捕捉PageView部件
                      onPageChanged: (value) {
                        setState(() {
                          _index = value;
                        });
                      },
                      children: [
                        AllScreen(),
                        WaitSendScreen(),
                        WaitReceivedScreen(),
                        ReceivedScreen(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
