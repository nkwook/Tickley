import 'package:flutter/material.dart';

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
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 0),
        // color: Colors.grey,
        decoration: BoxDecoration(
            color: const Color(0xffF4F4F5),
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          Container(
              alignment: Alignment.centerLeft,
              //margin: EdgeInsets.only(top: 15, bottom: 10),
              padding: EdgeInsets.only(left: 15, top: 10),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w700, height: 1.3),
                    children: <TextSpan>[
                      TextSpan(
                          text: "지금까지 ",
                          style: TextStyle(color: const Color(0xff929292))),
                      TextSpan(
                          text: widget.userLength.toString() + "명",
                          style: TextStyle(color: const Color(0xff375854))),
                      TextSpan(
                          text: "의 티끌러들과\n",
                          style: TextStyle(color: const Color(0xff929292))),
                      TextSpan(
                          text: "소나무" +
                              (widget.point * 0.01 / 6.6)
                                  .toStringAsPrecision(2)
                                  .toString() +
                              "그루",
                          style: TextStyle(color: const Color(0xff375854))),
                      TextSpan(
                          text: "를 지켰어요!",
                          style: TextStyle(color: const Color(0xff929292))),
                    ]),
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 12, bottom: 10),
              padding: EdgeInsets.only(left: 15),
              child: RichText(
                text: TextSpan(
                    style:
                        TextStyle(fontSize: 15, color: const Color(0xff375854)),
                    children: <TextSpan>[
                      TextSpan(text: "총 "),
                      TextSpan(
                        text: (widget.point * 0.01).toStringAsFixed(2) + "kg",
                      ),
                      TextSpan(text: "의 CO2를 저감했습니다")
                    ]),
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              // width: 300,
              height: 250,
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                        width: 300,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AspectRatio(
                                aspectRatio: 1.2 > 6.6 / (widget.point * 0.01)
                                    ? 1.2
                                    : 6.6 / (widget.point * 0.01),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/tree.png'),
                                          fit: BoxFit.fitWidth,
                                          alignment:
                                              FractionalOffset.bottomCenter)),
                                )))),
                    Container(
                        width: 300,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AspectRatio(
                                aspectRatio: 1.2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('assets/tree.png'),
                                          fit: BoxFit.fitWidth,
                                          alignment:
                                              FractionalOffset.bottomCenter,
                                          colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(0.05),
                                              BlendMode.dstATop))),
                                ))))
                  ])),
        ]));
  }
}
