import 'package:flutter/material.dart';
import 'package:smart_mall/pages/my/src/user_screen.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            child: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  testPic,
                  width: 56,
                  height: 56,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "谦和的黑椒汁Dmk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          "未设置签名",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const UserScreen();
              }));
            }),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: const [
                Expanded(
                    child: UserCardItem(
                  count: 10,
                  label: "收藏",
                )),
                Expanded(
                    child: UserCardItem(
                  count: 102,
                  label: "粉丝",
                )),
                Expanded(
                    child: UserCardItem(
                  count: 10,
                  label: "关注",
                )),
                Expanded(
                    child: UserCardItem(
                  count: 90,
                  label: "动态",
                ))
              ],
            ))
      ],
    );
  }
}

class UserCardItem extends StatefulWidget {
  const UserCardItem({Key? key, required this.count, required this.label})
      : super(key: key);
  final int count;
  final String label;
  @override
  State<UserCardItem> createState() => _UserCardItemState();
}

class _UserCardItemState extends State<UserCardItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(widget.count.toString()), Text(widget.label)],
    );
  }
}
