import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/theme.dart';
import 'package:smart_mall/pages/mall/goods_details/goods_details_screen.dart';

import 'package:smart_mall/pages/my/src/goods_widget.dart';

class WantScreen extends StatefulWidget {
  const WantScreen({Key? key}) : super(key: key);

  @override
  State<WantScreen> createState() => _WantScreenState();
}

class _WantScreenState extends State<WantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConstants.backgroundColor,
        body: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        "我想要的",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        "assets/svg/svg_search.svg",
                        width: 23,
                        height: 23,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/svg/svg_collection.svg",
                            width: 23,
                            height: 23,
                          )),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(31, 226, 226, 226),
                                width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: const Text("合并下单"),
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
                    child: Notes()),
                Expanded(
                    child: MediaQuery.removePadding(
                        removeTop: true,
                        removeBottom: true,
                        context: context,
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: GestureDetector(
                                  child: const GoodsWidget(),
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: ((context) =>
                                    //             const GoodsDetailsScreen())));
                                  },
                                ),
                              );
                            }))))
              ],
            )));
  }
}

//
class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(1.5))),
          child: const Text(
            "得物",
            style: TextStyle(color: Colors.white, fontSize: 11),
          )),
      const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          "先鉴别 后发货",
          style: TextStyle(fontSize: 12),
        ),
      ),
      const Expanded(child: SizedBox()),
      const Text(
        "多重鉴别  逐件检查  正品保障",
        style: TextStyle(fontSize: 9.8, color: Colors.grey),
      )
    ]);
  }
}
