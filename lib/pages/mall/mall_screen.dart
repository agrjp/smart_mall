import 'package:flutter/material.dart';

class MallScreen extends StatefulWidget {
  const MallScreen({Key? key}) : super(key: key);

  @override
  State<MallScreen> createState() => _MallScreenState();
}

class _MallScreenState extends State<MallScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("购物页面"),
    );
  }
}
