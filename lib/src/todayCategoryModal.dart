import 'package:flutter/material.dart';

class TodayCategoryModal extends StatefulWidget {
  final String temp;
  TodayCategoryModal({Key? key, required this.temp}) : super(key: key);

  TodayCategoryModalState createState() => TodayCategoryModalState();
}

class TodayCategoryModalState extends State<TodayCategoryModal> {
  // const BottomNavigator({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(widget.temp)],
          ),
        ));
  }
}
