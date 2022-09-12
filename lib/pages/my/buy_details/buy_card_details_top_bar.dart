import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuyDetailsTopBar extends StatefulWidget {
  const BuyDetailsTopBar({Key? key}) : super(key: key);

  @override
  State<BuyDetailsTopBar> createState() => _BuyDetailsTopBarState();
}

class _BuyDetailsTopBarState extends State<BuyDetailsTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text("我的购买",
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),),
          GestureDetector(
            child:Icon(Icons.headset_mic_outlined,
            size: 22,)
          )
        ],
      ),
    );
  }
}
