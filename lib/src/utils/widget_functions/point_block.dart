import 'package:flutter/material.dart';

import '../constants.dart';

class PointBlock extends StatelessWidget {
  final int point;

  const PointBlock({
    Key? key,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 50,
        height: 34,
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: COLOR_YELLOW),
        child: Text('\u{1F331} ' + point.toString(),
            style: TextStyle(color: COLOR_GREEN, fontWeight: FontWeight.bold)));
  }
}
