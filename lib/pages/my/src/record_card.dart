import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/pages/my/src/want_screen.dart';

class RecordCard extends StatefulWidget {
  const RecordCard({Key? key}) : super(key: key);

  @override
  State<RecordCard> createState() => _RecordCardState();
}

class _RecordCardState extends State<RecordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  child: const RecordCardItem(
                    svgPath: "assets/svg/svg_collection.svg",
                    label: "想要",
                    count: -1,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const WantScreen())));
                  },
                )),
                Container(
                  width: 1,
                  height: 26,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  color: Colors.grey.shade100,
                ),
                const Expanded(
                    child: RecordCardItem(
                  svgPath: "assets/svg/svg_cart_full.svg",
                  label: "我有",
                  count: 1,
                ))
              ],
            ),
            Container(
              height: 1,
              color: Colors.grey.shade100,
              margin: const EdgeInsets.only(top: 12, bottom: 12),
            ),
            Row(
              children: [
                const Expanded(
                    child: RecordCardItem(
                  svgPath: "assets/svg/svg_footprint.svg",
                  label: "足迹",
                  count: -1,
                )),
                Container(
                  width: 1,
                  height: 26,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  color: Colors.grey.shade100,
                ),
                const Expanded(
                    child: RecordCardItem(
                  svgPath: "assets/svg/svg_subscribe.svg",
                  label: "订阅",
                  count: -1,
                ))
              ],
            )
          ],
        ));
  }
}

class RecordCardItem extends StatefulWidget {
  const RecordCardItem(
      {Key? key,
      required this.svgPath,
      required this.label,
      required this.count})
      : super(key: key);
  final String svgPath;
  final String label;
  final int count;
  @override
  State<RecordCardItem> createState() => _RecordCardItemState();
}

class _RecordCardItemState extends State<RecordCardItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(widget.svgPath, width: 22, height: 22),
        Padding(
            padding: const EdgeInsets.only(left: 5), child: Text(widget.label)),
        const Expanded(child: SizedBox()),
        Text(
          widget.count.toString(),
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SvgPicture.asset(
          "assets/svg/svg_arrow_right.svg",
          width: 18,
          height: 18,
          color: Colors.grey,
        ),
      ],
    );
  }
}
