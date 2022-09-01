import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/theme.dart';
import 'package:smart_mall/pages/mall/src/mall_pageview_widget.dart';
import 'package:smart_mall/pages/mall/src/mall_second_tab.dart';
import 'package:smart_mall/pages/mall/src/mall_tob_tab.dart';

class MallScreen extends StatefulWidget {
  const MallScreen({Key? key}) : super(key: key);

  @override
  State<MallScreen> createState() => _MallScreenState();
}

class _MallScreenState extends State<MallScreen> {
  final List<String> _list = [];
  int _pageViewIndex = 0;
  final String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture/WechatIMG95.jpeg";

  @override
  void initState() {
    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG85.jpeg");

    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG86.jpeg");

    _list.add(
        "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2FWechatIMG87.jpeg");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConstants.backgroundColor,
        body: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            child: Column(
              children: [
                Container(
                  height: 38,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/svg_search.svg",
                        width: 20,
                        height: 20,
                      ),
                      const Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "三叶草男鞋",
                                style: TextStyle(color: Colors.grey),
                              ))),
                      SvgPicture.asset(
                        "assets/svg/svg_camera.svg",
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                //frist tab
                MallTobTab(index: _pageViewIndex),
                Expanded(
                    child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      _pageViewIndex = index;
                    });
                  },
                  children: const [
                    MallPageViewWidget(),
                    Center(
                      child: Text("鞋类"),
                    ),
                    Center(
                      child: Text("潮服"),
                    ),
                    Center(
                      child: Text("手表"),
                    ),
                    Center(
                      child: Text("包装"),
                    )
                  ],
                ))
              ],
            )));
  }
}
