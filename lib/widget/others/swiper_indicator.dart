import 'package:flutter/material.dart';

class SwiperIndicator extends StatefulWidget {
  const SwiperIndicator(
      {Key? key, required this.itemCount, required this.index})
      : super(key: key);
  final int index;
  final int itemCount;
  @override
  State<SwiperIndicator> createState() => _SwiperIndicatorState();
}

class _SwiperIndicatorState extends State<SwiperIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6,
        width: double.infinity,
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: widget.itemCount,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                    color: widget.index == index
                        ? const Color.fromARGB(255, 118, 118, 118)
                        : const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: const BorderRadius.all(Radius.circular(0.5))),
                margin: const EdgeInsets.only(left: 3, right: 3),
              );
            }));
  }
}
