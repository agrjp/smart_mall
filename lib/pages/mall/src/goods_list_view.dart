import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_mall/entity/goods.dart';
import 'package:smart_mall/pages/mall/goods_details/goods_details_screen.dart';
import 'package:smart_mall/pages/mall/src/goods_item.dart';

class GoodsListView extends StatefulWidget {
  const GoodsListView({Key? key, required this.goodsList}) : super(key: key);
  final List<Goods> goodsList;
  @override
  State<GoodsListView> createState() => _GoodsListViewState();
}

class _GoodsListViewState extends State<GoodsListView> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.goodsList.length,
            itemBuilder: (context, index) {
              return GoodsItem(goods: widget.goodsList[index]);
            }));
  }
}
