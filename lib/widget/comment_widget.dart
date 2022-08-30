import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  String testImageUrl =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest_pic.png";

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
            child: Image.network(
          testImageUrl,
          width: 32,
          height: 32,
          fit: BoxFit.fill,
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "jiaaang",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 2),
                child: Text("穿多久了,麻烦问一下穿多久了,麻烦问一下"),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "6天前",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ))
            ],
          ),
        ))
      ],
    );
  }
}
