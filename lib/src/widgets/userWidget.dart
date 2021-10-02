import 'package:flutter/material.dart';
import 'package:tickley/src/model/task.dart';
import '../utils/utils.dart';

class UserWidget extends StatefulWidget {
  final int id;

  UserWidget({Key? key, required this.id}) : super(key: key);

  @override
  UserWidgetState createState() => UserWidgetState();
}

class UserWidgetState extends State<UserWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child:CircleAvatar(
          radius: 60.0,
          backgroundImage: AssetImage('assets/tree.png'),
        ),
    );
  }
}
