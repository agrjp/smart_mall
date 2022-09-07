import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/entity/comment.dart';
import 'package:smart_mall/entity/content.dart';
import 'package:smart_mall/entity/user.dart';
import 'package:smart_mall/network/easy_http.dart';
import 'package:smart_mall/pages/home/recommends/src/recommend_details_top_bar.dart';
import 'package:smart_mall/util/data_util.dart';
import 'package:smart_mall/widget/comment_widget.dart';
import 'package:smart_mall/widget/others/swiper_indicator.dart';

class RecommendDetailsScreen extends StatefulWidget {
  const RecommendDetailsScreen(
      {Key? key, required this.user, required this.content})
      : super(key: key);
  final User user;
  final Content content;
  @override
  State<RecommendDetailsScreen> createState() => _RecommendDetailsScreenState();
}

class _RecommendDetailsScreenState extends State<RecommendDetailsScreen> {
  int _swiperIndicatorIndex = 0;
  List<Comment> _commentList = [];
  int likes = 0;
  @override
  void initState() {
    super.initState();
    EasyHttp.instance
        .selectCommentByContentId(widget.content.contentId)
        .then((value) {
      setState(() {
        _commentList = value;
      });
    });
    EasyHttp.instance
        .selectContentLikes(widget.content.contentId)
        .then((value) {
      setState(() {
        likes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: RecommendDetailsTopBar(
                        user: widget.user,
                      ),
                    ),
                  ),
                  //top 38是因为 RecommendDetailsTopBar 大概38
                  Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.62,
                                decoration: const BoxDecoration(),
                                child: Swiper(
                                  itemWidth: double.infinity,
                                  itemHeight: double.infinity,
                                  autoplay: true,
                                  itemCount: widget.content.photos.length,
                                  duration: 500,
                                  itemBuilder: (context, index) =>
                                      Image.network(
                                    "http://${widget.content.photos[index]}",
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  onIndexChanged: (value) {
                                    setState(() {
                                      _swiperIndicatorIndex = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: SwiperIndicator(
                                    itemCount: widget.content.photos.length,
                                    index: _swiperIndicatorIndex,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.content.title,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(widget.content.text),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 45,
                                      margin: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade200),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(2))),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            widget.user.picture,
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.fill,
                                          ),
                                          const Expanded(
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    "蒂芙尼配色AJ312 Low蒂芙尼配色AJ312 Low蒂芙尼配色AJ312",
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: Color.fromARGB(
                                                            134, 7, 6, 6)),
                                                  )))
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: Text(
                                            DateUtil.fromUtc(
                                                widget.content.time),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          )),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 0.6,
                                      color: const Color.fromARGB(
                                          255, 235, 235, 235),
                                      margin: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                    ),
                                    Text(
                                      "共${_commentList.length}条评论",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 10),
                                      child: MediaQuery.removePadding(
                                          removeTop: true,
                                          removeBottom: true,
                                          context: context,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: _commentList.length,
                                              itemBuilder: (content, index) {
                                                return CommentWidget(
                                                  comment: _commentList[index],
                                                );
                                              })),
                                    ),
                                    //底部加一个 sizebox 解决被底部的评论框挡住的问题
                                    const SizedBox(
                                      height: 85,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))),
                  //底部评论框
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        width: double.infinity,
                        height: 80,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.60,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 248, 248, 248),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/svg_edit_pen.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 6),
                                      child: Text(
                                        "来都来的，说两句",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      )),
                                ],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/svg_live.svg",
                                  width: 20,
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(likes.toString()),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 26, right: 26),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/svg_comment.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(_commentList.length.toString()),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
