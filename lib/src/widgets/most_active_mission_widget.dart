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
  List<String> usersList = [];

  @override
  void initState() {
    updateUsers_hard(widget.mission.id);
  }

  void updateUsers_hard(int id) async {
    usersList.add('assets/1.png');
    usersList.add('assets/2.png');
    usersList.add('assets/3.png');
    usersList.add('assets/4.png');
    // usersList.add('assets/google_logo.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
            elevation: 3,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                          TextSpan(
                              text: widget.mission.label,
                              style: TextStyle(color: Color(0xFFD6B589))),
                          TextSpan(
                              text: " 지금 " +
                                  usersList.length.toString() +
                                  "명이 참여했어요!",
                              style: TextStyle(color: Colors.black))
                        ]))),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  height: 60,
                  child: _userListView(),
                )
              ],
            )));
  }

  Widget _userListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(width: 1);
      },
      // physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 3.0),

      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: usersList.length,
      itemBuilder: (context, index) {
        return index == usersList.length
            ? Container(height: 1) // 개야매
            : Container(
                width: 65,
                height: 65,
                child: UserWidget(image: usersList[index]));
      },
    );
  }
}
