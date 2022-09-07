import 'package:flutter/material.dart';
import 'package:smart_mall/entity/comment.dart';
import 'package:smart_mall/entity/user.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/util/data_util.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  User _user = User();
  @override
  void initState() {
    super.initState();
    EasyHttp.instance.selectUserById(widget.comment.userId).then((value) {
      setState(() {
        _user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
            child: Image.network(
          _user.picture,
          width: 32,
          height: 32,
          fit: BoxFit.fill,
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _user.userName,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Text(widget.comment.text),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    DateUtil.fromUtc(widget.comment.time),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ))
            ],
          ),
        ))
      ],
    );
  }
}
