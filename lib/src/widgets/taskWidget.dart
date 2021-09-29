import 'package:flutter/material.dart';
import '../todayCategoryModal.dart';

class TaskWidget extends StatefulWidget {
  @override
  TaskWidgetState createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    var temp = 'fhgv d';

    return Container(
        child: Material(
            // color: Colors.green[100],
            child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return TodayCategoryModal(temp: temp);
            });
      },
      child: Container(
        decoration: BoxDecoration(
            // boxShadow:
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(8),
        child: Text('\u{1F6B0} 물 절약', style: _biggerFont),
      ),
    )));
  }
}
