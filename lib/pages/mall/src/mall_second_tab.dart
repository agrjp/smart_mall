import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MallSecondTab extends StatefulWidget {
  const MallSecondTab({Key? key}) : super(key: key);

  @override
  State<MallSecondTab> createState() => _MallSecondTabState();
}

class _MallSecondTabState extends State<MallSecondTab> {
  final String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture/WechatIMG95.jpeg";
  bool select = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        alignment: Alignment.center,
        width: double.infinity,
        height: 177,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: MasonryGridView.count(
                          crossAxisCount: 5,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Image.network(
                                  testPic,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                                const Text("品牌专区")
                              ],
                            );
                          })),
                  MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: MasonryGridView.count(
                          crossAxisCount: 5,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Image.network(
                                  testPic,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                                const Text("品牌专区")
                              ],
                            );
                          })),
                ],
                onPageChanged: (index) {
                  setState(() {
                    select = index == 0 ? true : false;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 3,
                  decoration: BoxDecoration(
                      color: select
                          ? const Color.fromARGB(255, 42, 196, 142)
                          : Colors.grey),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 20,
                  height: 3,
                  decoration: BoxDecoration(
                      color: !select
                          ? const Color.fromARGB(255, 42, 196, 142)
                          : Colors.grey),
                )
              ],
            )
          ],
        ));
  }
}
