import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/model/t_user.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'taskDetailModal.dart';
import '../widgets/userWidget.dart';
import '../widgets/categoryWidget.dart';
import '../api/api.dart';
import 'dart:math';

class MainTaskWidget extends StatefulWidget {
  Task task;

  MainTaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  TaskWidgetState2 createState() => TaskWidgetState2();
}

class TaskWidgetState2 extends State<MainTaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();
  List<String> usersList = [];

  @override
  void initState() {
    print("updateUsers");
    updateUsers_hard(widget.task.id);
  }

  //task완료 user 업뎃
  void updateUsers(int id) async {
    List<TUser> u = await fetchUsersByTask(id); // id : task id
    print(u);
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          widget.task.label + "를 한 친구들",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        Container(
          height: 50,
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
        return UserWidget(image: usersList[index]);
      },
    );
  }
}
