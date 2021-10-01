import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/utils.dart';

class TaskDetailModal extends StatefulWidget {
  Task task;
  int userId;

  TaskDetailModal({Key? key, required this.task, required this.userId})
      : super(key: key);

  TaskDetailModalState createState() => TaskDetailModalState();
}

class TaskDetailModalState extends State<TaskDetailModal> {
  Utils utils = new Utils();
  final _biggerFont = const TextStyle(fontSize: 22.0);
  final _biggerWhiteFont = const TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

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
                child: Text(widget.task.description),
              ),
              Material(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () async {
                      int result = await postTaskOperation(
                          widget.userId, widget.task.id);
                      if (result == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('환경 보호 성공! ' +
                                widget.task.point.toString() +
                                '점 을 얻었어요.')));
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error')),
                        );
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Text(
                          '했어요!!',
                          style: _biggerWhiteFont,
                          textAlign: TextAlign.center,
                        )),
                  ))
            ],
          ),
        ));
  }
}
