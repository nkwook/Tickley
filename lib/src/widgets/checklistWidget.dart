import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'taskDetailModal.dart';

class ChecklistWidget extends StatefulWidget {
  Task task;
  int userId;
  bool isCompleted;

  ChecklistWidget(
      {Key? key,
      required this.task,
      required this.userId,
      required this.isCompleted})
      : super(key: key);

  @override
  ChecklistWidgetState createState() => ChecklistWidgetState();
}

class ChecklistWidgetState extends State<ChecklistWidget> {
  final _biggerFont = const TextStyle(fontSize: 19.0);
  Utils utils = new Utils();
  bool isCompleted = false;
  bool isClicked = false;

  setIsCompleted() {
    setState(() {
      isCompleted = true;
      isClicked = true;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isCompleted = widget.isCompleted;
    });
    // print(widget.favoriteTasks);
  }

  @override
  Widget build(BuildContext context) {
    if (!isClicked) {
      setState(() {
        isCompleted = widget.isCompleted;
      });
    }
    return Container(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                // if (!true) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('미션 리스트에 추가되었습니다.')));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('이미 미션 리스트에 있습니다')));
                // }

                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return TaskDetailModal(
                          task: widget.task,
                          userId: widget.userId,
                          isCompleted: isCompleted,
                          setIsCompleted: setIsCompleted);
                    });
              },
              child: Container(
                  // width: 300.0,
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.grey : Colors.white,
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
