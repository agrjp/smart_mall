import 'package:flutter/material.dart';

class FootPrintsListViewItem extends StatefulWidget {
  const FootPrintsListViewItem({Key? key,required this.size}) : super(key: key);
final double size ;
  @override
  State<FootPrintsListViewItem> createState() => _FootPrintsListViewItemState();
}

class _FootPrintsListViewItemState extends State<FootPrintsListViewItem> {
  var image_url =
      "https://evaluate-duck-1303322291.cos.ap-guangzhou.myqcloud.com/user-picture%2Ftest-image.png";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * widget.size,
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Image.network(image_url,fit: BoxFit.fill,),
          ),
          SizedBox(height: 10,),
          Text("￥9999"),
        ],
      ),
    );
  }
}


