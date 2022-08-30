import 'package:flutter/material.dart';
import 'package:smart_mall/constants/callback.dart';
import 'package:smart_mall/widget/navigation/navigation_item.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({Key? key, required this.onClickListener})
      : super(key: key);
  final OnClickListener onClickListener;
  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  List<bool> selectList = [true, false, false];

  var unselect = Colors.grey;
  var select = Colors.black;

//点击后更换点击效果，并回调
  _selected(int index) {
    widget.onClickListener(index);

    for (int i = 0; i < selectList.length; i++) {
      if (i != index) {
        selectList[i] = false;
      }
    }
    selectList[index] = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: NavigationItem(
            iconPath: "assets/svg/svg_nav_home.svg",
            label: "首页",
            itemColor: selectList[0] ? select : unselect,
          ),
          onTap: () => _selected(0),
        ),
        GestureDetector(
          child: NavigationItem(
            iconPath: "assets/svg/svg_nav_shopping.svg",
            label: "购物",
            itemColor: selectList[1] ? select : unselect,
          ),
          onTap: () => _selected(1),
        ),
        GestureDetector(
          child: NavigationItem(
            iconPath: "assets/svg/svg_nav_my.svg",
            label: "我的",
            itemColor: selectList[2] ? select : unselect,
          ),
          onTap: () => _selected(2),
        ),
      ],
    );
  }
}
