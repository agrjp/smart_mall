import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/entity/user.dart';

class RecommendDetailsTopBar extends StatefulWidget {
  const RecommendDetailsTopBar({Key? key, required this.user})
      : super(key: key);
  final User user;
  @override
  State<RecommendDetailsTopBar> createState() => _RecommendDetailsTopBarState();
}

class _RecommendDetailsTopBarState extends State<RecommendDetailsTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 38,
      child: Row(
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
                widget.user.picture,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.user.userName,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/svg_local.svg",
                        width: 12,
                        height: 12,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            "深圳市",
                            style: TextStyle(fontSize: 11),
                          ))
                    ],
                  ))
            ],
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 3, bottom: 3),
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
      ),
    );
  }
}
