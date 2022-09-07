import 'package:flutter/material.dart';
import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/network/easy_http.dart';

import 'package:smart_mall/pages/home/home_screen.dart';
import 'package:smart_mall/pages/mall/mall_screen.dart';
import 'package:smart_mall/pages/my/my_screen.dart';
import 'package:smart_mall/widget/navigation/bottom_navigation.dart';

import '../constants/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _listScreen = [];
  int _pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _listScreen.add(const HomeScreen());
    _listScreen.add(const MallScreen());
    _listScreen.add(const MyScreen());
    EasyHttp.instance
        .selectUserByTelephone(UserInfo.userTelephone)
        .then((value) {
      UserInfo.user = value;
      UserInfo.isLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.backgroundColor,
      body: Column(
        children: [
          Expanded(child: _listScreen[_pageIndex]),
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 8,
                  left: 36,
                  right: 36,
                  top: 8),
              child: ButtomNavigation(
                onClickListener: (index) {
                  //收到点击回调->刷新页面
                  setState(() {
                    _pageIndex = index;
                  });
                },
              ))
        ],
      ),
    );
  }
}
