import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'task_detail_modal.dart';

class ChecklistWidget extends StatefulWidget {
  Task task;
  int userId;
  bool isCompleted;
  bool isTodayTask;

  ChecklistWidget(
      {Key? key,
      required this.task,
      required this.userId,
      required this.isCompleted,
      required this.isTodayTask})
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
      // print(isCompleted);
    }
    return Container(
        height: 60,
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {
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
                    child: widget.isTodayTask
                        ? Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text(
                                  utils.convertStringToUnicode(
                                          widget.task.emoji) +
                                      widget.task.label,
                                  style: _biggerFont,
                                  textAlign: TextAlign.center,
                                ),
                                Text('<추천>',
                                    style: TextStyle(color: Colors.orange))
                              ]))
                        : Text(
                            utils.convertStringToUnicode(widget.task.emoji) +
                                widget.task.label,
                            style: _biggerFont,
                            textAlign: TextAlign.center,
                          )))));
  }
}
