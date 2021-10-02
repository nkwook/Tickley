import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'taskDetailModal.dart';
import '../widgets/userWidget.dart';
import '../widgets/categoryWidget.dart';


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
        Text("hhh"),
        UserList(users: [1, 2, 3]),
      ],
    ));
  }
}

class UserList extends StatelessWidget {
  final List<int> users;

  UserList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(width: 20);
      },
      padding: EdgeInsets.only(top: 8.0),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserWidget(
          id: users[index], //users.id
        );
      },
    );
  }
}
