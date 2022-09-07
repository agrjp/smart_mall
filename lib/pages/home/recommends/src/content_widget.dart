import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/entity/content.dart';
import 'package:smart_mall/entity/user.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/home/recommends/recommend_details_screen.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key, required this.content}) : super(key: key);
  final Content content;

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  Random random = Random.secure();
  int _like = 0;
  User _user = User();
  @override
  void initState() {
    super.initState();
    EasyHttp.instance
        .selectContentLikes(widget.content.contentId)
        .then((value) {
      setState(() {
        _like = value;
      });
    });
    EasyHttp.instance.selectUserById(widget.content.userId).then((value) {
      setState(() {
        _user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300 + random.nextInt(20) * 1.0,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("http://${widget.content.photos[0]}"),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.content.title,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        _user.picture,
                        width: 20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          _user.userName,
                          style: const TextStyle(fontSize: 11),
                        )),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset("assets/svg/svg_live.svg",
                        width: 13, height: 13),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        _like.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => RecommendDetailsScreen(
                      user: _user,
                      content: widget.content,
                    ))));
      },
    );
  }
}
