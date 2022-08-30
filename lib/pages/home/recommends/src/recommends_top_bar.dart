import 'package:flutter/material.dart';

import 'package:smart_mall/constants/callback.dart';

class RecommendsTopTab extends StatefulWidget {
  const RecommendsTopTab({Key? key, required this.onClickListener})
      : super(key: key);
  final OnClickListener onClickListener;

  @override
  State<RecommendsTopTab> createState() => _RecommendsTopTabState();
}

class _RecommendsTopTabState extends State<RecommendsTopTab> {
  List<bool> selectList = [true, false, false, false, false];

  double unselectFontSize = 15;
  double selectFontSize = 16;

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Text(
            "全部",
            style: TextStyle(
                fontSize: selectList[0] ? selectFontSize : unselectFontSize,
                color: selectList[0] ? Colors.black : Colors.grey),
          ),
          onTap: () {
            selected(0);
            widget.onClickListener(0);
          },
        ),
        Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: GestureDetector(
              child: Text(
                "视频",
                style: TextStyle(
                    fontSize: selectList[1] ? selectFontSize : unselectFontSize,
                    color: selectList[1] ? Colors.black : Colors.grey),
              ),
              onTap: () {
                selected(1);
                widget.onClickListener(1);
              },
            )),
        GestureDetector(
          child: Text(
            "潮鞋",
            style: TextStyle(
                fontSize: selectList[2] ? selectFontSize : unselectFontSize,
                color: selectList[2] ? Colors.black : Colors.grey),
          ),
          onTap: () {
            selected(2);
            widget.onClickListener(2);
          },
        ),
        Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: GestureDetector(
              child: Text(
                "穿搭",
                style: TextStyle(
                    fontSize: selectList[3] ? selectFontSize : unselectFontSize,
                    color: selectList[3] ? Colors.black : Colors.grey),
              ),
              onTap: () {
                selected(3);
                widget.onClickListener(3);
              },
            )),
        GestureDetector(
          child: Text(
            "手表",
            style: TextStyle(
                fontSize: selectList[4] ? selectFontSize : unselectFontSize,
                color: selectList[4] ? Colors.black : Colors.grey),
          ),
          onTap: () {
            selected(4);
            widget.onClickListener(4);
          },
        )
      ],
    );
  }
}
