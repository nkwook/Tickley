import 'package:flutter/material.dart';

import '../utils/utils.dart';

class UserWidget extends StatefulWidget {
  final String image;

  UserWidget({Key? key, required this.image}) : super(key: key);

  @override
  UserWidgetState createState() => UserWidgetState();
}

class UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage(widget.image),
      ),
    );
  }
}
