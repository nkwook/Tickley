import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/utils/utils.dart';

import 'user_widget.dart';

import '../api/api.dart';

class MainMissionWidget extends StatefulWidget {
  Mission mission;

  MainMissionWidget({Key? key, required this.mission}) : super(key: key);

  @override
  MissionWidgetState2 createState() => MissionWidgetState2();
}

class MissionWidgetState2 extends State<MainMissionWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();
  List<String> usersList = [];

  @override
  void initState() {
    // print("updateUsers");
    updateUsers_hard(widget.mission.id);
  }

  //task완료 user 업뎃
  void updateUsers(int id) async {
    List<TUser> u = await fetchUsersByMission(id); // id : task id
    // print(u);
    setState(() {
      //tasks = t;
      //usersList = u;
    });
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
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                  TextSpan(
                      text: widget.mission.label,
                      style: TextStyle(color: Color(0xFFD6B589))),
                  TextSpan(
                      text: " 활동을 한 친구들", style: TextStyle(color: Colors.black))
                ])),
            Container(
              margin: EdgeInsets.only(top: 8, bottom: 10),
              height: 60,
              child: _userListView(),
            )
          ],
        ));
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
