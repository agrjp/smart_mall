import 'package:flutter/material.dart';

class RecencyBuyCard extends StatefulWidget {
  const RecencyBuyCard({Key? key}) : super(key: key);

  @override
  State<RecencyBuyCard> createState() => _RecencyBuyCardState();
}

class _RecencyBuyCardState extends State<RecencyBuyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "最近购买(1000+)",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 12)),
          MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: RecencyBuyItem(),
                    );
                  }))
        ],
      ),
    );
  }
}

class RecencyBuyItem extends StatelessWidget {
  const RecencyBuyItem({Key? key}) : super(key: key);
  final String testImageUrl =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Row(
          children: [
            ClipOval(
                child: Image.network(
              testImageUrl,
              fit: BoxFit.fill,
              width: 15,
              height: 15,
            )),
            const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  "得*7",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                )),
          ],
        )),
        Expanded(
            child: Text(
          "36",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )),
        Expanded(
            child: Text(
          "¥499",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )),
        Expanded(
            child: Text(
          "2天前",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ))
      ],
    );
  }
}
