import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';

class TaskDetailModal extends StatefulWidget {
  Task task;
  int userId;
  bool isCompleted;
  Function setIsCompleted;

  TaskDetailModal(
      {Key? key,
      required this.task,
      required this.userId,
      required this.setIsCompleted,
      required this.isCompleted})
      : super(key: key);

  TaskDetailModalState createState() => TaskDetailModalState();
}

class TaskDetailModalState extends State<TaskDetailModal> {
  Utils utils = new Utils();
  final _normalFont = const TextStyle(fontSize: 15.0);

  final _biggerFont = const TextStyle(fontSize: 22.0);
  final _biggerFont2 = const TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 20),
              Text(
                  utils.convertStringToUnicode(widget.task.emoji) +
                      widget.task.label,
                  style: _biggerFont),
              Divider(),
              Container(
                height: 110,
                margin: EdgeInsets.only(top: 20),
                child: Text(widget.task.description, style: _normalFont),
              ),
              Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () async {
                      if (!widget.isCompleted) {
                        int result = await postTaskOperation(
                            widget.userId, widget.task.id);
                        if (result == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('환경 보호 성공! ' +
                                  widget.task.point.toString() +
                                  '점 을 얻었어요.')));

                          widget.setIsCompleted();
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Error')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('환경 보호에 동참해주셔서 감사합니다\u{1F603}')));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: widget.isCompleted
                            ? Text(
                                '완료한 활동\u{1F44D}',
                                style: _biggerFont2,
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                '완료하기\u{2705}',
                                style: _biggerFont2,
                                textAlign: TextAlign.center,
                              )),
                  ))
            ],
          ),
        ));
  }
}
