import 'package:flutter/material.dart';

class FootprintsTopBar extends StatefulWidget {
  const FootprintsTopBar({Key? key}) : super(key: key);

  @override
  State<FootprintsTopBar> createState() => _FootprintsTopBarState();
}

class _FootprintsTopBarState extends State<FootprintsTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              "我的足迹",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          )),
          Container(
            // color: Colors.cyan,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text("清空",),
                ),
                GestureDetector(
                  child: Text("管理"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
