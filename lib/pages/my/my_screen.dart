import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mall/constants/theme.dart';
import 'package:smart_mall/pages/my/src/buy_card.dart';
import 'package:smart_mall/pages/my/src/record_card.dart';
import 'package:smart_mall/pages/my/src/user_card.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.backgroundColor,
      body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/svg_scan.svg",
                          width: 25,
                          height: 25,
                        ),
                        const Expanded(child: SizedBox()),
                        SvgPicture.asset(
                          "assets/svg/svg_setting.svg",
                          width: 25,
                          height: 25,
                        )
                      ],
                    )),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 26, right: 26, top: 16, bottom: 16),
                  child: UserCard(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: RecordCard(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: BuyCard(),
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        SettingItem(
                          label: "账号安全",
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: SettingItem(
                              label: "隐私政策",
                            )),
                        SettingItem(
                          label: "通用设置",
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: SettingItem(
                              label: "注销账号",
                            )),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class SettingItem extends StatefulWidget {
  const SettingItem({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 30,
        child: Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(fontSize: 14.5),
            ),
            const Expanded(child: SizedBox()),
            SvgPicture.asset(
              "assets/svg/svg_arrow_right.svg",
              width: 22,
              height: 22,
            )
          ],
        ));
  }
}
