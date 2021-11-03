import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/model/mission/mission.dart';

import 'package:tickley/src/utils/utils.dart';

import 'user_widget.dart';

class MostActiveMissionWidget extends StatefulWidget {
  Mission mission;

  MostActiveMissionWidget({Key? key, required this.mission}) : super(key: key);

  @override
  MostActiveMissionWidgetState createState() => MostActiveMissionWidgetState();
}

class MostActiveMissionWidgetState extends State<MostActiveMissionWidget> {
  Utils utils = new Utils();
  // List<String> usersList = [' '];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
            elevation: 3,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                            TextSpan(
                                text: widget.mission.label,
                                style: TextStyle(color: Colors.orangeAccent)),
                            TextSpan(
                                text: utils.convertStringToUnicode(
                                    widget.mission.emoji)),
                          ])),
                      Row(children: [
                        Icon(Icons.people, color: Colors.grey),
                        Text("    " + 1000.toString() + "명이 참여했어요!",
                            style: TextStyle(color: Colors.black))
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child:
                                    Icon(Icons.timelapse, color: Colors.grey)),
                            Flexible(
                                flex: 7,
                                child: Container(
                                  // margin: EdgeInsets.only(bottom: 10, left: 10),
                                  child: _userListView(),
                                ))
                          ]),
                    ]))));
  }

  Widget _userListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 1);
      },
      // physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 3.0),

      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("흥냐흥냐흥냐 님"),
            Text("10분 전", style: TextStyle(color: Colors.grey))
          ],
        ));
      },
    );
  }
}
