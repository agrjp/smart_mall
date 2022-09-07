import 'package:flutter/material.dart';

import 'package:smart_mall/constants/user_Info.dart';
import 'package:smart_mall/entity/content.dart';
import 'package:smart_mall/network/easy_http.dart';

import 'package:smart_mall/pages/my/src/user_screen.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int careOther = 0;
  int mFans = 0;
  List<Content> list = [];
  @override
  void initState() {
    super.initState();
    EasyHttp.instance.selectCareList().then((value) {
// ignore: unused_local_variable
      for (var element in value) {
        if (element.userId == UserInfo.user.uuid) {
          mFans = mFans + 1;
        }
        if (element.otherId == UserInfo.user.uuid) {
          careOther = careOther + 1;
        }
      }
      setState(() {});
    });
    EasyHttp.instance.selectContentByUserId(UserInfo.user.uuid).then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            child: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  UserInfo.user.picture,
                  width: 56,
                  height: 56,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UserInfo.isLogin ? UserInfo.user.userName : "未登陆",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Padding(
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
              if (!UserInfo.isLogin) {
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const UserScreen();
              }));
            }),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                const Expanded(
                    child: UserCardItem(
                  count: -1,
                  label: "收藏",
                )),
                Expanded(
                    child: UserCardItem(
                  count: mFans,
                  label: "粉丝",
                )),
                Expanded(
                    child: UserCardItem(
                  count: careOther,
                  label: "关注",
                )),
                Expanded(
                    child: UserCardItem(
                  count: list.length,
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
