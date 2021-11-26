import 'package:flutter/material.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

class CompletedMissionWidget extends StatefulWidget {
  CompletedMission mission;

  CompletedMissionWidget({
    Key? key,
    required this.mission,
  }) : super(key: key);

  @override
  CompletedMissionWidgetState createState() => CompletedMissionWidgetState();
}

class CompletedMissionWidgetState extends State<CompletedMissionWidget> {
  Utils utils = new Utils();

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //     child:
        // Material(
        // borderRadius: BorderRadius.all(Radius.circular(20)),
        // elevation: 2,
        // child: InkWell(
        //   borderRadius: BorderRadius.all(Radius.circular(20)),
        //   child:
        Container(
            width: 250,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                // border: Border.all(color: Colors.black),
                ),
            // boxShadow:
            padding: const EdgeInsets.all(8),
            child: Text(
              utils.convertStringToUnicode(widget.mission.emoji) +
                  widget.mission.label,
              style: BiggerFont,
              textAlign: TextAlign.center,
            ));
    // )));
  }
}
