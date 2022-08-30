import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mall/constants/callback.dart';

class TopTab extends StatefulWidget {
  const TopTab({Key? key, required this.onClickListener, required this.index})
      : super(key: key);
  final OnClickListener onClickListener;
  final int index;
  @override
  State<TopTab> createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> {
  List<bool> selectList = [false, true, false];

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
    selected(widget.index);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg/svg_search.svg",
          width: 22,
          height: 22,
          color: Colors.black,
        ),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                "关注",
                style: TextStyle(
                    fontSize: selectList[0] ? 22 : 17,
                    fontWeight:
                        selectList[0] ? FontWeight.bold : FontWeight.normal),
              ),
              onTap: () {
                selected(0);
                widget.onClickListener(0);
              },
            ),
            Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: GestureDetector(
                  child: Text("推荐",
                      style: TextStyle(
                          fontSize: selectList[1] ? 22 : 17,
                          fontWeight: selectList[1]
                              ? FontWeight.bold
                              : FontWeight.normal)),
                  onTap: () {
                    selected(1);
                    widget.onClickListener(1);
                  },
                )),
            GestureDetector(
              child: Text(
                "直播",
                style: TextStyle(
                    fontSize: selectList[2] ? 22 : 17,
                    fontWeight:
                        selectList[2] ? FontWeight.bold : FontWeight.normal),
              ),
              onTap: () {
                selected(2);
                widget.onClickListener(2);
              },
            )
          ],
        )),
        SvgPicture.asset(
          "assets/svg/svg_camera.svg",
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ],
    );
  }
}
