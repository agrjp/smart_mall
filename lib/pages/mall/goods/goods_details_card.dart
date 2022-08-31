import 'package:flutter/material.dart';

class GoodsDetailsCard extends StatelessWidget {
  const GoodsDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "¥${399}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              Text("1.2万+付款",
                  style: TextStyle(fontSize: 11, color: Colors.grey)),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("1.8万+想要",
                      style: TextStyle(fontSize: 11, color: Colors.grey)))
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              "最低每日1.19元，立即开通",
              style: TextStyle(fontSize: 12),
            ),
          ),
          const Text(
            "Nike Team Hustle D 8 JDI(GS)黑白红#送礼推荐",
            style:
                TextStyle(fontSize: 18, color: Color.fromARGB(255, 95, 93, 93)),
          )
        ],
      ),
    );
  }
}
