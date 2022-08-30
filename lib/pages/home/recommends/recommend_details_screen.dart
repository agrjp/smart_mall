import 'package:flutter/material.dart';
import 'package:smart_mall/pages/home/recommends/src/recommend_details_top_bar.dart';

class RecommendDetailsScreen extends StatefulWidget {
  const RecommendDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecommendDetailsScreen> createState() => _RecommendDetailsScreenState();
}

class _RecommendDetailsScreenState extends State<RecommendDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 6),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: RecommendDetailsTopBar(),
                )
              ],
            )));
  }
}
