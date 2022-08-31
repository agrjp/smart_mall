import 'package:flutter/material.dart';

class GoodsWidget extends StatelessWidget {
  const GoodsWidget({Key? key}) : super(key: key);
  final String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture/WechatIMG95.jpeg";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            testPic,
            width: 110,
            height: 110,
            fit: BoxFit.fill,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Low蒂芙尼配色AJ312 AJ312 Low蒂芙尼配色AJ312 Low蒂芙尼配色AJ312 Low蒂芙尼配色AJ312 Low蒂芙尼配色AJ312",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                      color: Colors.grey),
                  maxLines: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("42"),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: const Text("得物",
                          style: TextStyle(fontSize: 9, color: Colors.white)),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Text(
                          "¥241",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
