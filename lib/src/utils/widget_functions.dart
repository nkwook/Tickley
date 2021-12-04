import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget CustomCircularProgressIndicator() {
  return SizedBox(
      height: 50,
      width: 50,
      child: Center(
          child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey))));
}

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 14,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

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
