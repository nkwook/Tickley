import 'package:flutter/material.dart';
import 'package:tickley/src/utils/utils.dart';
import '../todayCategoryModal.dart';

class TaskWidget extends StatefulWidget {
  String label;
  String emoji;
  int id;

  TaskWidget(
      {Key? key, required this.label, required this.emoji, required this.id})
      : super(key: key);

  @override
  TaskWidgetState createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();

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
          child: Text(utils.convertStringToUnicode(widget.emoji) + widget.label,
              style: _biggerFont)),
    )));
  }
}
