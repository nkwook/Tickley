import 'package:flutter/material.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'todayCategoryModal.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  int userId;

  TaskWidget({Key? key, required this.task, required this.userId})
      : super(key: key);

  @override
  TaskWidgetState createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return TodayCategoryModal(
                          task: widget.task, userId: widget.userId);
                    });
              },
              child: Container(
                  // width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black),
                  ),
                  // boxShadow:
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    utils.convertStringToUnicode(widget.task.emoji) +
                        widget.task.label,
                    style: _biggerFont,
                    textAlign: TextAlign.center,
                  )),
            )));
  }
}
