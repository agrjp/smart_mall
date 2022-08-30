import 'package:flutter/material.dart';

class RecommendDetailsTopBar extends StatefulWidget {
  const RecommendDetailsTopBar({Key? key}) : super(key: key);

  @override
  State<RecommendDetailsTopBar> createState() => _RecommendDetailsTopBarState();
}

class _RecommendDetailsTopBarState extends State<RecommendDetailsTopBar> {
  String testImageUrl =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";
  @override
  Widget build(BuildContext context) {
    return Row(
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
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: ClipOval(
                child: Image.network(
              testImageUrl,
              width: 30,
              height: 30,
              fit: BoxFit.fill,
            ))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "jiaaang",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.local_atm, size: 12),
                Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "深圳市",
                      style: TextStyle(fontSize: 11),
                    ))
              ],
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        GestureDetector(
          child: Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 10, 198, 198),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: GestureDetector(
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      "关注",
                      style: TextStyle(fontSize: 13.9, color: Colors.white),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
