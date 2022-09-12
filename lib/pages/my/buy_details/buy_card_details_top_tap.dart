import 'package:flutter/material.dart';
import 'package:smart_mall/constants/callback.dart';

class BuyDetailsTopTap extends StatefulWidget {
  const BuyDetailsTopTap(
      {Key? key, required this.onClickListener, required this.index})
      : super(key: key);
  final OnClickListener onClickListener;
  final int index;

  @override
  State<BuyDetailsTopTap> createState() => _BuyDetailsTopTapState();
}

class _BuyDetailsTopTapState extends State<BuyDetailsTopTap> {
  List<bool> selectList = [true, false, false, false];

  //点击后更换点击效果
  selected(int index) {
    for (int i = 0; i < selectList.length; i++) {
      if (i != index) {
        selectList[i] = false;
      }
    }
    selectList[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    selected(widget.index);//每次改变都会调用 绑定滑动窗口
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: Text(
            "全部",
            style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectList[0] ? FontWeight.bold : FontWeight.normal),
          ),
          onTap: () {
            selected(0);
            widget.onClickListener(0); //接口回调告诉父组件改变
          },
        ),
        GestureDetector(
          child: Text(
            "待发货",
            style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectList[1] ? FontWeight.bold : FontWeight.normal),
          ),
          onTap: () {
            selected(1);
            widget.onClickListener(1);
          },
        ),
        GestureDetector(
          child: Text(
            "待收货",
            style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectList[2] ? FontWeight.bold : FontWeight.normal),
          ),
          onTap: () {
            selected(2);
            widget.onClickListener(2);
          },
        ),
        GestureDetector(
          child: Text(
            "已签收",
            style: TextStyle(
                fontSize: 18,
                fontWeight:
                    selectList[3] ? FontWeight.bold : FontWeight.normal),
          ),
          onTap: () {
            selected(3);
            widget.onClickListener(3);
          },
        )
      ],
    );
  }
}
