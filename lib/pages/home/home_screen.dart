import 'package:flutter/material.dart';
import 'package:smart_mall/constants/theme.dart';
import 'package:smart_mall/pages/home/follow/follow_screen.dart';
import 'package:smart_mall/pages/home/live/live_screen.dart';
import 'package:smart_mall/pages/home/recommends/recommends_screen.dart';
import 'package:smart_mall/widget/top_tab/top_tab.dart';

//首页
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _index = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConstants.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TopTab(
                      index: _index,
                      onClickListener: (index) {
                        _pageController.jumpToPage(index);
                      })),
              Expanded(
                  child: PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                onPageChanged: (value) {
                  setState(() {
                    _index = value;
                  });
                },
                children: const [
                  FollowScreen(),
                  RecommendsScreen(),
                  LiveScreen(),
                ],
              ))
            ],
          ),
        ));
  }
}
