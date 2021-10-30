import 'package:flutter/material.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class CompletedMissionWidget extends StatefulWidget {
  CompletedMission mission;
  int userId;

  CompletedMissionWidget(
      {Key? key, required this.mission, required this.userId})
      : super(key: key);

  @override
  CompletedMissionWidgetState createState() => CompletedMissionWidgetState();
}

class CompletedMissionWidgetState extends State<CompletedMissionWidget> {
  Utils utils = new Utils();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // onTap: () {
              //   showModalBottomSheet(
              //       context: context,
              //       builder: (BuildContext context) {
              //         return TaskDetailModal(
              //             task: widget.task, userId: widget.userId);
              //       });
              // },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black),
                  ),
                  // boxShadow:
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    utils.convertStringToUnicode(widget.mission.emoji) +
                        widget.mission.label,
                    style: BiggerFont,
                    textAlign: TextAlign.center,
                  )),
            )));
  }
}
