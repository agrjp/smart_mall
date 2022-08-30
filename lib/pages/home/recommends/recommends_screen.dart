import 'package:flutter/material.dart';
import 'package:smart_mall/pages/home/recommends/src/recommends_list_view.dart';
import 'package:smart_mall/pages/home/recommends/src/recommends_top_bar.dart';

class RecommendsScreen extends StatefulWidget {
  const RecommendsScreen({Key? key}) : super(key: key);

  @override
  State<RecommendsScreen> createState() => _RecommendsScreenState();
}

class _RecommendsScreenState extends State<RecommendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 9, bottom: 9),
            child: RecommendsTopTab(onClickListener: (index) {
              setState(() {});
            })),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: RecommendsListView(),
        ))
      ],
    );
  }
}
