import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils.dart';

class MissionText extends StatelessWidget {
  String emoji;
  String label;

  MissionText({Key? key, required this.emoji, required this.label})
      : super(key: key);

  Utils utils = new Utils();

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontSize: 15,
                color: COLOR_DARK_BLUE,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
          TextSpan(
              text: utils.convertStringToUnicode(emoji) + '\t',
              style: TextStyle(fontSize: 22)),
          TextSpan(text: label)
        ]));
  }
}
