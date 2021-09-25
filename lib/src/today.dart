import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  @override
  TodayState createState() => TodayState();
}

class TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _today(),
    );
  }

  Widget _today() {
    return Text("2nd!!!");
  }
}
