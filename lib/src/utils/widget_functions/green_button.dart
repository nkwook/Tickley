import 'package:flutter/material.dart';

import '../constants.dart';

class GreenButton extends StatefulWidget {
  final String text;
  final Function onTapFunction;

  const GreenButton({Key? key, required this.text, required this.onTapFunction})
      : super(key: key);

  GreenButtonState createState() => GreenButtonState();
}

class GreenButtonState extends State<GreenButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: COLOR_GREEN,
        elevation: 2,
        textStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
            onTap: () {
              widget.onTapFunction();
            },
            child: Container(
                alignment: Alignment.center,
                width: 320,
                height: 55,
                child: Text(widget.text))));
  }
}
