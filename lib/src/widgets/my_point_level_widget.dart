import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class MyPointLevelWidget extends StatefulWidget {
  TUser userData;
  MyPointLevelWidget({Key? key, required this.userData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPointLevelWidgetState();
}

class _MyPointLevelWidgetState extends State<MyPointLevelWidget> {
  Utils utils = new Utils();

  Map<String, dynamic> levelMap = {};

  @override
  void initState() {
    levelMap = utils.convertPointToLevel(widget.userData.point);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        SizedBox(height: 18),
        CircleAvatar(
          radius: 70.0,
          backgroundImage: AssetImage(levelMap['imgUrl']),
          backgroundColor: COLOR_GREY,
        ),
        SizedBox(height: 21),
        Container(
            child: RichText(
          text: TextSpan(style: FontBoldGreen24, children: <TextSpan>[
            TextSpan(text: widget.userData.nickname),
            TextSpan(text: ' 님', style: FontBoldGreen20)
          ]),
        )),
        SizedBox(height: 30),
        Container(
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '에코 포인트',
                style: FontBoldGreen20,
              ),
              RichText(
                text: TextSpan(style: FontBoldGreen18, children: <TextSpan>[
                  TextSpan(text: widget.userData.point.toString()),
                  TextSpan(text: ' Point', style: FontNormalGreen18)
                ]),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 330,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: LinearProgressIndicator(
              value: (widget.userData.point - levelMap['start']) /
                  (levelMap['end'] - levelMap['start'] + 1),
              valueColor:
                  // new AlwaysStoppedAnimation<Color>(Color(levelMap['color'])),
                  new AlwaysStoppedAnimation<Color>(COLOR_GREEN),
              backgroundColor: Color(0xffEFEFEF),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: COLOR_BORDER, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          width: 330,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(color: Color(0xFF727272), fontSize: 14),
                children: <TextSpan>[
                  TextSpan(text: widget.userData.nickname + ' 님의 에코 레벨은 '),
                  TextSpan(
                      text: levelMap['label'],
                      style: TextStyle(
                          color: Color(0xFF727272),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '로 ' +
                          levelMap['next'] +
                          '를 만나기까지 ' +
                          (levelMap['end'] - widget.userData.point + 1)
                              .toString() +
                          ' Point 남았어요!\n\n' +
                          widget.userData.nickname +
                          ' 님은 '),
                  TextSpan(
                      text: '상위 ' +
                          widget.userData.pointPercentage.toStringAsFixed(1) +
                          '%',
                      style: TextStyle(
                          color: Color(0xFF727272),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextSpan(text: '의 티끌이입니다.\n환경보호에 앞장서는 당신이 멋저요\u{1F44D}')
                ]),
          ),
        ),
      ],
    );
  }
}
