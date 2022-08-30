import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 底部导航的item，现在是icon+text的组合
class NavigationItem extends StatefulWidget {
  const NavigationItem(
      {Key? key,
      required this.iconPath,
      required this.label,
      required this.itemColor})
      : super(key: key);
  final String iconPath;
  final String label;
  final Color itemColor;

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          widget.iconPath,
          width: 23,
          height: 23,
          color: widget.itemColor,
        ),
        Text(
          widget.label,
          style: TextStyle(color: widget.itemColor),
        )
      ],
    );
  }
}
