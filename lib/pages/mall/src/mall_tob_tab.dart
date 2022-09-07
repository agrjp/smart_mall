import 'package:flutter/material.dart';

class MallTobTab extends StatefulWidget {
  const MallTobTab({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<MallTobTab> createState() => _MallTobTabState();
}

class _MallTobTabState extends State<MallTobTab> {
  final List<String> _labelList = [];
  @override
  void initState() {
    super.initState();
    _labelList.add("推荐");
    _labelList.add("鞋类");
    _labelList.add("潮服");
    _labelList.add("手表");
    _labelList.add("电脑");
    _labelList.add("美妆");
    _labelList.add("首饰");
    _labelList.add("箱子");
    _labelList.add("鞋类");
    _labelList.add("潮服");
    _labelList.add("手表");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 12, bottom: 12),
        //  color: Colors.black,
        width: double.infinity,
        child: ListView.builder(
            itemCount: _labelList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Text(
                        _labelList[index],
                        style: TextStyle(
                            fontSize: widget.index == index ? 17.5 : 17,
                            fontWeight:
                                widget.index == index ? FontWeight.bold : null),
                      ),
                      widget.index == index
                          ? Container(
                              width: 26,
                              height: 3,
                              color: const Color.fromARGB(255, 42, 196, 142),
                            )
                          : const SizedBox()
                    ],
                  ));
            })));
  }
}
