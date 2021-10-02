import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/model/user.dart';
import 'package:tickley/src/utils/utils.dart';
import 'taskDetailModal.dart';
import '../widgets/userWidget.dart';
import '../widgets/categoryWidget.dart';
import '../api/api.dart';

class MainTaskWidget extends StatefulWidget {
  Task task;
  List<int> usersId;

  MainTaskWidget({Key? key, required this.task, required this.usersId})
      : super(key: key);

  @override
  TaskWidgetState2 createState() => TaskWidgetState2();
}

class TaskWidgetState2 extends State<MainTaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();
  List<User> usersList = [];

  @override
  void initState() {
    updateUsers(widget.task.id);
  }

  //task완료 user 업뎃
  void updateUsers(int id) async {
    List<User> u = await fetchUsersByTask(id); // id : task id
    setState(() {
      //tasks = t;
      usersList = u;
    });
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
        return Container(width: 20);
      },
      // physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 8.0),

      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: usersList.length,
      itemBuilder: (context, index) {
        return UserWidget(image: usersList[index].profileImage);
      },
    );
  }
}
