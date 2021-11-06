import 'package:flutter/material.dart';
import 'package:tickley/src/utils/constants.dart';

class AllUserPointWidget extends StatefulWidget {
  int point;
  int userLength;
  AllUserPointWidget({Key? key, required this.point, required this.userLength})
      : super(key: key);

  @override
  AllUserPointWidgetState createState() => AllUserPointWidgetState();
}

class AllUserPointWidgetState extends State<AllUserPointWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: <
        Widget>[
      Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 70, bottom: 15),
          padding: EdgeInsets.only(left: 25),
          child: RichText(
            text: TextSpan(style: BiggerBoldFont, children: <TextSpan>[
              TextSpan(text: "지금까지 "),
              TextSpan(
                  text: widget.userLength.toString() + "명",
                  style: TextStyle(color: Colors.blue)),
              TextSpan(text: "의 티끌러들과\n"),
              TextSpan(
                  text: (widget.point * 0.01).toString() + "kg",
                  style: TextStyle(color: Colors.green)),
              TextSpan(text: "의 CO2를 저감했어요")
            ]),
          )),
      Container(
          width: 300,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: Colors.grey.shade300)),
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
                width: 150,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                        aspectRatio: 6.6 / (widget.point * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  // scale: 1.5,
                                  image: AssetImage('assets/pine-tree.png'),
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.bottomCenter)),
                        )))),
            Container(
                width: 150,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                        aspectRatio: 0.6,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  // scale: 1.5,
                                  image: AssetImage('assets/pine-tree.png'),
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.bottomCenter,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.05),
                                      BlendMode.dstATop))),
                        ))))
          ])),
      Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 15, bottom: 10),
          padding: EdgeInsets.only(right: 40),
          child: RichText(
            text: TextSpan(style: BiggerFont20, children: <TextSpan>[
              TextSpan(text: "대략 30년산 소나무 "),
              TextSpan(
                  text: (widget.point * 0.01 / 6.6)
                          .toStringAsPrecision(2)
                          .toString() +
                      "그루",
                  style: TextStyle(color: Colors.red)),
              TextSpan(text: "\n가 1년에 흡수하는 양이랍니다"),
            ]),
          )),
    ]);
  }
}
