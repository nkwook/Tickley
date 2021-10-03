import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';
import 'taskDetailModal.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  int userId;
  bool isFavorite;
  List<Task> favoriteTasks;
  Function(int) updateFavoriteTasks;
  Function updateToday;

  TaskWidget(
      {Key? key,
      required this.task,
      required this.userId,
      required this.isFavorite,
      required this.favoriteTasks,
      required this.updateFavoriteTasks,
      required this.updateToday})
      : super(key: key);

  @override
  TaskWidgetState createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();
  bool isFavorite = false;
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavorite = widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!clicked) {
      setState(() {
        isFavorite = widget.isFavorite;
      });
    }
    return Container(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                if (!isFavorite) {
                  postFavoriteTask(widget.userId, widget.task.id);
                  setState(() {
                    clicked = true;
                    isFavorite = true;
                  });
                  widget.updateFavoriteTasks(widget.userId);
                  widget.updateToday();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('체크리스트에 추가되었습니다.')));
                } else {
                  // TODO: add delete
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('이미 체크리스트에 있는 활동입니다.')));
                }
              },
              child: Container(
                  // width: 300.0,
                  decoration: BoxDecoration(
                    color: isFavorite ? Colors.grey : Colors.white,
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
