import 'package:flutter/material.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions.dart';

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
    return Container(
      width: 250,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          // border: Border.all(color: Colors.black),
          ),
      padding: const EdgeInsets.all(8),
      child:
          MissionText(emoji: widget.mission.emoji, label: widget.mission.label),
    );
    // )));
  }
}
