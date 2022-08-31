import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/theme.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<bool> tabSelectList = [true, false, false];
  final PageController _controller = PageController();
  String testPic =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";
  tabSelect(int index) {
    for (int i = 0; i < tabSelectList.length; i++) {
      if (index != i) {
        tabSelectList[i] = false;
      }
    }
    tabSelectList[index] = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConstants.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 16,
                    right: 16),
                color: const Color.fromARGB(255, 87, 86, 86),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.list,
                          size: 26,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              testPic,
                              width: 68,
                              height: 68,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text("谦和的黑椒汁Dmk",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                      SvgPicture.asset(
                                          "assets/svg/svg_sex_man.svg",
                                          width: 20,
                                          height: 20)
                                    ],
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 3)),
                                  Row(
                                    children: const [
                                      Text(
                                        "IP属地:广东省 ｜ 加入得物625天",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white70),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "未设置签名",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            Text("获赞与收藏",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white))
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: const [
                                Text("0",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                Text("粉丝",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white))
                              ],
                            )),
                        Column(
                          children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            Text("关注",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white))
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        const Text("编辑资料",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                )),
            //tab
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: ThemeConstants.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      "动态",
                      style: TextStyle(
                          fontSize: 15,
                          color: tabSelectList[0] ? Colors.black : Colors.grey),
                    ),
                    onTap: () {
                      tabSelect(0);
                      _controller.jumpToPage(0);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: GestureDetector(
                      child: Text(
                        "收藏",
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                tabSelectList[1] ? Colors.black : Colors.grey),
                      ),
                      onTap: () {
                        tabSelect(1);
                        _controller.jumpToPage(1);
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "赞过",
                      style: TextStyle(
                          fontSize: 15,
                          color: tabSelectList[2] ? Colors.black : Colors.grey),
                    ),
                    onTap: () {
                      tabSelect(2);
                      _controller.jumpToPage(2);
                    },
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: double.infinity,
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (index) {
                        tabSelect(index);
                      },
                      children: const [
                        Center(
                          child: Text("动态页 - 待完善"),
                        ),
                        Center(child: Text("收藏页 - 待完善")),
                        Center(child: Text("赞过页 - 待完善"))
                      ],
                    )))
          ],
        ));
  }
}
